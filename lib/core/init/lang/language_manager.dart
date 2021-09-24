import 'package:flutter/material.dart';
import '../../constants/image/image_constants.dart';
import '../../constants/enums/locale_keys_enum.dart';
import '../cache/locale_manager.dart';

class LanguageManager {
  static LanguageManager? _instance;

  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  final ruLocale = Locale('ru', 'RU');
  final enLocale = Locale('en', 'US');

  Locale? _appLocale;
  int get defaultLocaleIndex => 1;
  Locale get appLocale => _appLocale ?? supportedLocales[defaultLocaleIndex];
  set appLocale(Locale locale) => _appLocale = locale;

  LanguageManager._init() {
    var language = LocaleManager.instance.getStringValue(PreferencesKeys.LOCALE_LANGUAGE);
    var country = LocaleManager.instance.getStringValue(PreferencesKeys.LOCALE_COUNTRY);

    if (language.isNotEmpty) {
      _appLocale = Locale(language, country);
    }
  }

  List<Locale> get supportedLocales => [ruLocale, enLocale];

  Map toDropdown() {
    var languageList = {};

    languageList[0] = 'Русский';
    languageList[1] = 'English';

    return languageList;
  }

  String getImagePath(String? code) {
    //I use country code instead of language code, so I need to lower it
    if(code != null) {
      code = code.toLowerCase();
    }

    var path = ImageConstants.instance.flagEn;
    switch(code) {
      case 'ru': path = ImageConstants.instance.flagRu; break;
    }

    return path;
  }
}
