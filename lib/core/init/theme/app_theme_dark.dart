import '../../constants/app/app_constants.dart';
import 'package:flutter/material.dart';
import 'app_theme.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    return _instance ??= AppThemeDark._init();
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData(
    fontFamily: ApplicationConstants.FONT_FAMILY,
    colorScheme: _appColorScheme,
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    /*brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,*/
  );

  ColorScheme get _appColorScheme {
    return ColorScheme(
        primary: Colors.white,
        primaryVariant: Color(0xFF080111), //xx
        secondary: Color(0xFF42A301),
        secondaryVariant: Color(0xFFEB2226), //xx
        surface: Color(0xFF222222), //xx
        background: Color(0xff424242), //xx
        error: Colors.red[900]!,
        onPrimary: Color(0xFF075AAA), //xx
        onSecondary: Color(0xFFFFC803), //xx
        onSurface: Color(0xff444444), //xx
        onBackground: Colors.white,//xx
        onError: Colors.black, //xx
        brightness: Brightness.dark);
  }
}