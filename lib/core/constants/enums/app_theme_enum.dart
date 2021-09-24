enum AppThemes { LIGHT, DARK }

extension AppThemeExtension on AppThemes{
  String get rawValue {
    switch(this) {
      case AppThemes.DARK: return 'dark';
      default: return 'light';
    }
  }
}