import 'package:flutter/material.dart';
import '../theme/app_theme_dark.dart';
import '../theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  //ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData _currentTheme;
  bool _isDark;

  ThemeNotifier(this._currentTheme, this._isDark);


  ThemeData get currentTheme => _currentTheme;
  bool get isDark => _isDark;

  void changeTheme() {
    if (!_isDark) {
      _currentTheme = AppThemeDark.instance.theme;
    } else {
      _currentTheme = AppThemeLight.instance.theme;
    }
    _isDark = !_isDark;

    notifyListeners();
  }
}