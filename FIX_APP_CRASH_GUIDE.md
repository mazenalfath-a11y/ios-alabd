# دليل إصلاح مشكلة تجمّد وعدم فتح التطبيق (App Startup & Crash Fix Guide)

هذا الدليل يحتوي على جميع الخطوات والكود المحدث لحل مشكلة عدم فتح التطبيق، التجمد عند شاشة التحميل البيضاء/السوداء، وإغلاق التطبيق الإجباري (Crash on Launch).

---

## 1️⃣ تعديل ملف `lib/main.dart`

**الهدف:** عدم تعطيل تشغيل التطبيق بطلبات الشبكة، وحماية الـ SecureStorage من الـ Crash، ومعالجة أخطاء الـ `FutureBuilder`.

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_version/services/notification_service.dart';
// استورد بقية الشاشات والـ Providers الخاصة بمشروعك...

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. تهيئة الفايربيز بدون تعطيل runApp
  try {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(NotificationService.backgroundHandler);
  } catch (e) {
    debugPrint("⚠️ Firebase initialization notice: $e");
  }

  // 2. تشغيل خدمة الإشعارات في الخلفية دون التسبب في تأخير الفتح
  NotificationService.init().catchError((e) {
    debugPrint("⚠️ NotificationService init error: $e");
  });

  runApp(
    MultiProvider(
      providers: [
        // اضف الـ Providers الخاصة بمشروعك
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<Map<String, dynamic>> _initializeApp() async {
    try {
      const storage = FlutterSecureStorage();
      String? token;

      // حماية قراءة التوكن من الـ Crash
      try {
        token = await storage.read(key: "userToken");
      } catch (e) {
        debugPrint("⚠️ Storage read token error: $e");
      }

      if (token == null || token.isEmpty) {
        return {'route': 'login', 'userData': null};
      }

      final apiService = ApiService();
      final response = await apiService.request("student/getuser", null, "GET");

      if (response != null && response.statusCode == 200) {
        try {
          await storage.write(key: "lastRoute", value: "home");
        } catch (_) {}
        return {'route': 'home', 'userData': null};
      } else if (response != null && response.statusCode == 403) {
        try {
          await storage.write(key: "lastRoute", value: "pending");
        } catch (_) {}
        return {'route': 'pending', 'userData': null};
      } else {
        String? lastRoute;
        try {
          lastRoute = await storage.read(key: "lastRoute");
        } catch (_) {}
        return {'route': lastRoute ?? 'login', 'userData': null};
      }
    } catch (e) {
      debugPrint("⚠️ _initializeApp exception: $e");
      return {'route': 'login', 'userData': null};
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // إعدادات الـ Theme والـ Locale الخ...
      home: FutureBuilder<Map<String, dynamic>>(
        future: _initializeApp(),
        builder: (context, snapshot) {
          // ✅ أهم خطوة: فحص snapshot.hasError لمنع التجمد
          if (snapshot.hasError) {
            debugPrint("⚠️ FutureBuilder error: ${snapshot.error}");
            return const LoginScreen();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            );
          }

          final route = snapshot.data?['route'] ?? 'login';

          if (route == 'home') return MainScreen();
          if (route == 'pending') return PendingVerificationScreen();
          return const LoginScreen();
        },
      ),
    );
  }
}
```

---

## 2️⃣ تعديل ملف `lib/services/notification_service.dart`

**الهدف:** تغليف استدعاءات الشبكة والفايربيز داخل `try-catch` لعدم التسبب في استثناءات غير معالجة (Uncaught Exceptions).

```dart
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_version/data/api_service.dart';

class NotificationService {
  static final ApiService _apiService = ApiService();

  static Future<void> init() async {
    try {
      try {
        await Firebase.initializeApp();
      } catch (_) {
        // تم التهيئة سابقاً
      }

      FirebaseMessaging messaging = FirebaseMessaging.instance;
      await messaging.requestPermission();

      String? fcmToken = await messaging.getToken();
      print("📲 FCM Token: $fcmToken");

      if (fcmToken != null) {
        _saveTokenInBackground(fcmToken);
      }

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print("📨 Foreground notification: ${message.notification?.title}");
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print("📩 Notification clicked: ${message.notification?.title}");
      });
    } catch (e) {
      print("❌ NotificationService init error: $e");
    }
  }

  static Future<void> _saveTokenInBackground(String fcmToken) async {
    try {
      final userResponse = await _apiService.request("student/getuser", null, "GET");

      if (userResponse != null && userResponse.statusCode == 200) {
        final userId = userResponse.data["_id"];

        if (userId != null) {
          final saveResponse = await _apiService.request(
            "student/notification/savetoken/$userId",
            {"fcmToken": fcmToken},
            "POST",
          );
          if (saveResponse?.statusCode == 200) {
            print("✅ Token saved successfully");
          }
        }
      }
    } catch (e) {
      print("❌ Error saving FCM token: $e");
    }
  }

  static Future<void> backgroundHandler(RemoteMessage message) async {
    try {
      await Firebase.initializeApp();
      print("🔔 Background message: ${message.messageId}");
    } catch (e) {
      print("❌ Background handler error: $e");
    }
  }
}
```

---

## 3️⃣ تعديل ملف `android/app/src/main/AndroidManifest.xml`

**الهدف:** إشهار دعم فتح الروابط الخارجية وتطبيقات التواصل لعدم حدوث أخطاء `url_launcher`.

أضف المقطع التالي داخل عنصر `<manifest>`:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.POST_NOTIFICATIONS" />

    <application ...>
        ...
    </application>

    <!-- ✅ استعلامات فتح الروابط والتطبيقات الخارجية -->
    <queries>
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT"/>
            <data android:mimeType="text/plain"/>
        </intent>
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="https" />
        </intent>
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="http" />
        </intent>
        <intent>
            <action android:name="android.intent.action.SENDTO" />
            <data android:scheme="mailto" />
        </intent>
        <package android:name="com.whatsapp" />
        <package android:name="com.whatsapp.w4b" />
        <package android:name="com.facebook.katana" />
        <package android:name="com.facebook.lite" />
    </queries>
</manifest>
```

---

## 4️⃣ تعديل ملف `android/app/build.gradle.kts`

**الهدف:** تفعيل `Core Library Desugaring` للتوافق مع مكتبات Java/Dart الحديثة على أجهزة الأندرويد.

```kotlin
android {
    ...
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true // ✅ تفعيل الخيار
    }
}

dependencies {
    // ✅ إضافة هذه التبعية داخل قسم dependencies
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.4")
}
```

---

## 5️⃣ خطوات التنفيذ عبر السطر الأوامر (Terminal Commands)

بعد تطبيق التعديلات المذكورة أعلاه، نفّذ الأوامر التالية بالترتيب لإزالة الكاش التالف وبناء نسخة جديدة ومستقرة:

```bash
# 1. مسح الكاش القديم المسبب للأخطاء
flutter clean

# 2. إعادة تحميل المكتبات
flutter pub get

# 3. بناء نسخة APK جديدة واختبارها
flutter build apk --release
```
