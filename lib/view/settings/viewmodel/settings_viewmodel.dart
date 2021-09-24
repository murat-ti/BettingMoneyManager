import 'dart:io';
import 'package:provider/provider.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/init/lang/language_manager.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/constants/enums/locale_keys_enum.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base/model/base_view_model.dart';
import '../../../../core/extension/string_extension.dart';
part 'settings_viewmodel.g.dart';

class SettingsViewModel = SettingsViewModelBase with _$SettingsViewModel;

abstract class SettingsViewModelBase with Store, BaseViewModel {
  List<Locale> languageList = LanguageManager.instance.supportedLocales;
  Map languageMap = LanguageManager.instance.toDropdown();

  @observable
  Locale currentLocale = LanguageManager.instance.appLocale;
  @observable
  String activeLanguagePath = LanguageManager.instance.getImagePath(LanguageManager.instance.appLocale.countryCode);

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}

  Future<void> changeAppTheme() async {
    if (context != null) {
      context!.read<ThemeNotifier>().changeTheme();
      await localeManager.setBoolValue(PreferencesKeys.THEME, context!.read<ThemeNotifier>().isDark);
    }
  }

  Future<void> changeAppLocalization(Locale? locale) async {
    if (locale != null && LanguageManager.instance.supportedLocales.contains(locale)) {
      currentLocale = locale;
      activeLanguagePath = LanguageManager.instance.getImagePath(locale.countryCode);
      await localeManager.setStringValue(PreferencesKeys.LOCALE_LANGUAGE, locale.languageCode);
      await localeManager.setStringValue(PreferencesKeys.LOCALE_COUNTRY, locale.countryCode ?? '');
      await context?.setLocale(locale);
      LanguageManager.instance.appLocale = locale;
    }
  }

  void rateApp() {
    if (Platform.isAndroid) {
      ApplicationConstants.googlePlay.launchWebsite;
    }
  }
}