// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsViewModel on SettingsViewModelBase, Store {
  final _$currentLocaleAtom = Atom(name: 'SettingsViewModelBase.currentLocale');

  @override
  Locale get currentLocale {
    _$currentLocaleAtom.reportRead();
    return super.currentLocale;
  }

  @override
  set currentLocale(Locale value) {
    _$currentLocaleAtom.reportWrite(value, super.currentLocale, () {
      super.currentLocale = value;
    });
  }

  final _$activeLanguagePathAtom =
      Atom(name: 'SettingsViewModelBase.activeLanguagePath');

  @override
  String get activeLanguagePath {
    _$activeLanguagePathAtom.reportRead();
    return super.activeLanguagePath;
  }

  @override
  set activeLanguagePath(String value) {
    _$activeLanguagePathAtom.reportWrite(value, super.activeLanguagePath, () {
      super.activeLanguagePath = value;
    });
  }

  @override
  String toString() {
    return '''
currentLocale: ${currentLocale},
activeLanguagePath: ${activeLanguagePath}
    ''';
  }
}
