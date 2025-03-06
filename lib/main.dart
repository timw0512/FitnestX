import 'package:easy_localization/easy_localization.dart';
import 'package:fitness/core/navigation/main_scaffold.dart';
import 'package:fitness/core/services/shared_preferences_service.dart';
import 'package:fitness/core/theme/theme.dart';
import 'package:fitness/features/auth/presentation/pages/log_in.dart';
import 'package:fitness/features/on_board/data/datasources/onboarding_local_datasource.dart';
import 'package:fitness/features/on_board/data/repositories/onboarding_repository_impl.dart';
import 'package:fitness/features/on_board/presentation/pages/on_boarding.dart';
import 'package:fitness/features/profile/presentation/pages/profile_page.dart';
import 'package:fitness/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final sharedPreferencesService = SharedPreferencesService();

  final dataSource = OnboardingLocalDataSource();
  final repository = OnboardingRepositoryImpl(dataSource);

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', ''), Locale('vi', '')],
      fallbackLocale: Locale('en', ''),
      path: 'assets/localization',
      child: MultiProvider(
        providers: [
          Provider<OnboardingRepositoryImpl>(create: (context) => repository),
          Provider<SharedPreferencesService>(
            create: (context) => sharedPreferencesService,
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/':
            (context) => FutureBuilder<Widget>(
              future: _checkOnboardingAndLogin(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return snapshot.data!;
                }
              },
            ),
        '/onboarding': (context) => OnBoarding(),
        '/setting': (context) => SettingsPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

Future<Widget> _checkOnboardingAndLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool onboardingComplete = prefs.getBool('onboarding_complete') ?? false;
  bool isLoggedIn = prefs.getBool('is_logged_in') ?? false;

  if (isLoggedIn) {
    return MainScaffold();
  } else if (onboardingComplete) {
    return LoginPage();
  } else {
    return OnBoarding();
  }
}
