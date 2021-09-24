import 'package:flutter/material.dart';
import '../../constants/enums/locale_keys_enum.dart';
import '../cache/locale_manager.dart';
import 'app_theme_dark.dart';
import 'app_theme_light.dart';

class ThemeManager extends ChangeNotifier{
  static ThemeManager? _instance;
  static ThemeManager get instance {
    _instance ??= ThemeManager._init();
    return _instance!;
  }

  ThemeData? _currentTheme;
  ThemeData get currentTheme => _currentTheme ?? AppThemeLight.instance.theme;
  //AppThemes? _currentThemeEnum;

  ThemeManager._init() {
    setTheme();
  }

  Future<void> setTheme() async{
    var theme = LocaleManager.instance.getBoolValue(PreferencesKeys.THEME);
    if (theme) {
      _currentTheme = AppThemeLight.instance.theme;
    } else {
      _currentTheme = AppThemeDark.instance.theme;
    }
    notifyListeners();
  }

}