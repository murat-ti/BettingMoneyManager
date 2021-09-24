import 'package:easy_localization/easy_localization.dart';
import '../init/lang/locale_keys.g.dart';

extension DateLocalization on int {
  String? shortMonthTitle() {
    switch(this) {
      case 1: return LocaleKeys.months_jan.tr();
      case 2: return LocaleKeys.months_feb.tr();
      case 3: return LocaleKeys.months_mar.tr();
      case 4: return LocaleKeys.months_apr.tr();
      case 5: return LocaleKeys.months_may.tr();
      case 6: return LocaleKeys.months_jun.tr();
      case 7: return LocaleKeys.months_jul.tr();
      case 8: return LocaleKeys.months_aug.tr();
      case 9: return LocaleKeys.months_sep.tr();
      case 10: return LocaleKeys.months_oct.tr();
      case 11: return LocaleKeys.months_nov.tr();
      case 12: return LocaleKeys.months_dec.tr();
    }
  }
}