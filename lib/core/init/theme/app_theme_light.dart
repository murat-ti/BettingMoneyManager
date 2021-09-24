import '../../constants/app/app_constants.dart';
import 'package:flutter/material.dart';
import 'app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
    fontFamily: ApplicationConstants.FONT_FAMILY,
    colorScheme: _appColorScheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    /*primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.red,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,*/
  );

  ColorScheme get _appColorScheme {
    return ColorScheme(
        primary: Colors.black,
        primaryVariant: Colors.white, //xx
        secondary: Color(0xFF2B6305), //xx
        secondaryVariant: Color(0xFFEB2226), //xx
        surface: Color(0xFFEDEDED), //xx
        background: Color(0xfff6f9fc),
        error: Color(0xffff0000),
        onPrimary: Color(0xFF075AAA), //xx
        onSecondary: Color(0xFFFFC803), //xx
        onSurface: Color(0xfff8f1f1),
        onBackground: Colors.white,//xx
        onError: Colors.black, //xx
        brightness: Brightness.light);
  }
}