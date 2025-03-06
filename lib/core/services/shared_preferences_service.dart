import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _isFirstLaunchKey = 'isFirstLaunch';

  Future<bool> getIsFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isFirstLaunchKey) ?? true; // Default to true
  }

  Future<void> setIsFirstLaunch(bool value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_isFirstLaunchKey, value);
      if (kDebugMode) {
        print('SharedPreferences: set isFirstLaunch to $value');
      }
    } catch (e) {
      if (kDebugMode) {
        print('SharedPreferences error: $e');
      }
    }
  }
}
