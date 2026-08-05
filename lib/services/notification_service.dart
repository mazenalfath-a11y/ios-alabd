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
        // Firebase might already be initialized in main()
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
      final userResponse =
          await _apiService.request("student/getuser", null, "GET");

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
          } else {
            print("❌ error happened saving token");
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
