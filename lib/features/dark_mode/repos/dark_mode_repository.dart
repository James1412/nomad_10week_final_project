import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeConfigRepository extends ChangeNotifier {
  static const _darkMode = 'darkmode';
  final SharedPreferences _preferences;

  DarkModeConfigRepository(this._preferences);

  Future<void> setDarkMode(bool value) async {
    _preferences.setBool(_darkMode, value);
  }

  bool get isDarkMode => _preferences.getBool(_darkMode) ?? false;
}
