import 'package:easy_localization/easy_localization.dart';
import 'package:fitness/core/navigation/main_scaffold.dart';
import 'package:fitness/core/services/shared_preferences_service.dart';
import 'package:fitness/core/theme/theme.dart';
import 'package:fitness/features/on_board/data/datasources/onboarding_local_datasource.dart';
import 'package:fitness/features/on_board/data/repositories/onboarding_repository_impl.dart';
import 'package:fitness/features/on_board/presentation/pages/on_boarding.dart';
import 'package:fitness/features/profile/presentation/pages/profile_page.dart';
import 'package:fitness/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final sharedPreferencesService = SharedPreferencesService();
  final isFirstLaunch = await sharedPreferencesService.getIsFirstLaunch();

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
        child: MyApp(isFirstLaunch: isFirstLaunch),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isFirstLaunch;
  const MyApp({super.key, required this.isFirstLaunch});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system, // O
      home: isFirstLaunch ? OnBoarding() : MainScaffold(),
      routes: {
        '/profile': (context) => ProfilePage(),
        '/setting': (context) => SettingsPage(),
      },
    );
  }
}
