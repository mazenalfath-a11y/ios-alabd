import 'package:flutter/material.dart';
import 'package:flutter_version/data/api_service.dart';
import 'package:flutter_version/screens/entering_account/login_screen.dart';
import 'package:flutter_version/screens/entering_account/pending_verification_screen.dart';
import 'package:flutter_version/screens/mainscreens/main_screen.dart';
import 'package:flutter_version/screens/entering_account/register_screen1.dart';
import 'package:flutter_version/screens/entering_account/register_screen2.dart';
import 'package:flutter_version/utilities/theme_provider.dart';
import 'package:flutter_version/utilities/app_colors.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_version/providers/company_settings_provider.dart';
import '../../l10n/app_localizations.dart';
import 'package:flutter_version/utilities/locale_provider.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/rendering.dart';

import 'package:firebase_core/firebase_core.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // debugPaintSizeEnabled = true;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => CompanySettingsProvider()),
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
      try {
        token = await storage.read(key: "userToken");
      } catch (e) {
        debugPrint("⚠️ Storage read token error: $e");
      }

      if (token == null || token.isEmpty) {
        return {
          'route': 'login',
          'userData': null,
        };
      }

      final apiService = ApiService();
      final response = await apiService.request("student/getuser", null, "GET");

      if (response != null && response.statusCode == 200) {
        // User is authenticated - save state
        try {
          await storage.write(key: "lastRoute", value: "home");
        } catch (_) {}
        return {
          'route': 'home',
          'userData': null,
        };
      } else if (response != null && response.statusCode == 403) {
        // User exists but not verified
        try {
          await storage.write(key: "lastRoute", value: "pending");
        } catch (_) {}
        return {
          'route': 'pending',
          'userData': null,
        };
      } else {
        // Network error / other error - fall back to cached route
        String? lastRoute;
        try {
          lastRoute = await storage.read(key: "lastRoute");
        } catch (_) {}
        return {
          'route': lastRoute ?? 'login',
          'userData': null,
        };
      }
    } catch (e) {
      debugPrint("⚠️ _initializeApp exception: $e");
      return {
        'route': 'login',
        'userData': null,
      };
    }
  }

  Future<void> _loadCompanySettings(
    BuildContext context,
    CompanySettingsProvider companySettingsProvider,
    ThemeProvider themeProvider,
  ) async {
    try {
      const storage = FlutterSecureStorage();
      final companyCode = await storage.read(key: "companyCode");
      final companyId = await storage.read(key: "companyId");
      debugPrint(
          "🏢 companyCode=$companyCode companyId=$companyId"); // ← add this

      if (companyCode == null ||
          companyCode.isEmpty ||
          companyId == null ||
          companyId.isEmpty) {
        debugPrint(
            "🏢 Skipping settings fetch — missing companyCode/companyId");
        return;
      }

      final success = await companySettingsProvider.fetchCompanySettings(
        companyCode: companyCode,
        companyId: companyId,
      );

      if (success && companySettingsProvider.settings != null) {
        final colors = companySettingsProvider.settings!.appColors;
        themeProvider.setColorsFromCompanySettings(
          primary: colors.primary,
          secondary: colors.secondary,
          background: colors.background,
          surface: colors.surface,
          textPrimary: colors.textPrimary,
          textSecondary: colors.textSecondary,
          success: colors.success,
          error: colors.error,
        );
      }
    } catch (e) {
      debugPrint('Error loading company settings: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final companySettingsProvider =
        Provider.of<CompanySettingsProvider>(context);

    // Sync static colors with provider
    AppColors.primaryColor = themeProvider.primaryColor;
    AppColors.secondaryColor = themeProvider.secondaryColor;
    AppColors.backgroundColor = themeProvider.backgroundColor;
    AppColors.surfaceColor = themeProvider.surfaceColor;
    AppColors.textPrimaryColor = themeProvider.textPrimaryColor;
    AppColors.textSecondaryColor = themeProvider.textSecondaryColor;
    AppColors.successColor = themeProvider.successColor;
    AppColors.errorColor = themeProvider.errorColor;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'El3bd In English',
      themeMode: themeProvider.currentTheme,
      locale: localeProvider.locale,
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData.light().copyWith(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        cardColor: AppColors.getCardBackgroundColor(false),
        dividerColor: AppColors.lightDivider,
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.primaryBlue,
          onPrimary: Colors.white,
          surface: AppColors.getSurfaceColor(false),
          onSurface: AppColors.textPrimaryColor,
          secondary: AppColors.secondaryColor,
          onSecondary: Colors.white,
          error: AppColors.errorColor,
          onError: Colors.white,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(color: AppColors.textPrimaryColor),
          titleMedium: TextStyle(color: AppColors.textPrimaryColor),
          bodyLarge: TextStyle(color: AppColors.textPrimaryColor),
          bodyMedium: TextStyle(color: AppColors.textSecondaryColor),
        ),
        iconTheme: IconThemeData(color: AppColors.getIconColor(false)),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundColor,
          foregroundColor: AppColors.textPrimaryColor,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: AppColors.primaryBlue,
        scaffoldBackgroundColor: AppColors.darkBackground,
        cardColor: AppColors.darkCardBackground,
        dividerColor: AppColors.darkDivider,
        colorScheme: const ColorScheme.dark().copyWith(
          primary: AppColors.primaryBlue,
          onPrimary: Colors.white,
          surface: AppColors.darkSurface,
          onSurface: AppColors.darkTextPrimary,
          secondary: AppColors.secondaryColor,
          onSecondary: Colors.white,
          error: AppColors.error,
          onError: Colors.white,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: AppColors.darkTextPrimary),
          titleMedium: TextStyle(color: AppColors.darkTextPrimary),
          bodyLarge: TextStyle(color: AppColors.darkTextPrimary),
          bodyMedium: TextStyle(color: AppColors.darkTextSecondary),
        ),
        iconTheme: IconThemeData(color: AppColors.getIconColor(true)),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkSurface,
          foregroundColor: AppColors.darkTextPrimary,
          elevation: 0,
        ),
      ),
      home: FutureBuilder<Map<String, dynamic>>(
        future: _initializeApp(),
        builder: (context, snapshot) {
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

          // Load company settings in background after app starts
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!companySettingsProvider.isLoading &&
                companySettingsProvider.settings == null) {
              _loadCompanySettings(
                context,
                companySettingsProvider,
                themeProvider,
              );
            }
          });

          // Route to appropriate screen
          if (route == 'home') return MainScreen();
          if (route == 'pending') return PendingVerificationScreen();
          return const LoginScreen();
        },
      ),
      routes: {
        '/login': (_) => const LoginScreen(),
        '/register1': (_) => const RegisterScreen1(),
        '/home': (_) => MainScreen(),
        '/register2': (_) => const RegisterScreen2(
              firstName: '',
              lastName: '',
              username: '',
              password: '',
              companyCode: '',
            ),
      },
    );
  }
}
