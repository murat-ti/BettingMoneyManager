import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';
import '../init/lang/locale_keys.g.dart';

extension StringLocalization on String {
  String get locale => this.tr();
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
  String get innerLevelSelectOption => '   - ';
}

extension ParseDateExtension on String {
  String? shortWeekdayTitle(var inType) {
    var result = dtParse(inType);
    if(result != null) {
      switch(result.weekday) {
        case 1: return LocaleKeys.weekdays_mon.tr();
        case 2: return LocaleKeys.weekdays_tue.tr();
        case 3: return LocaleKeys.weekdays_wed.tr();
        case 4: return LocaleKeys.weekdays_thur.tr();
        case 5: return LocaleKeys.weekdays_fri.tr();
        case 6: return LocaleKeys.weekdays_sat.tr();
        case 7: return LocaleKeys.weekdays_sun.tr();
      }
    }
  }

  String? shortMonthTitle() {
      switch(int.parse(this)) {
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

  String? dtFormat(var inType, var outType) {
    try {
      var datetime = DateFormat(inType).parse(this);
      return DateFormat(outType).format(datetime);
    } catch (er) {
      return '$this';
    }
  }

  DateTime? dtParse(var inType) {
    try {
      return DateFormat(inType).parse(this);
    } catch (er) {
      return null;
    }
  }

  String? dtNow(var outType) {
    try {
      return DateFormat(outType).format(DateTime.now());
    } catch (er) {
      return '$this';
    }
  }

  DateTime currentDate() =>
      DateTime(DateTime
          .now()
          .year, DateTime
          .now()
          .month, DateTime
          .now()
          .day);

  int minutesBetween(var inType) {
    var from = dtParse(inType);
    //print('from $from');
    var to = DateTime.now();
    //print('to $to');
    try {
      return (to
          .difference(from!)
          .inMinutes).round();
    } catch (er) {
      return 0;
    }
  }
}

extension NetworkImageExtension on String {
  String get randomImage => 'https://picsum.photos/200/300';

  String get randomSquareImage => 'https://picsum.photos/200';

  String get customProfileImage => 'https://www.gravatar.com/avatar/?d=mp';

  String get customHighProfileImage => 'https://www.gravatar.com/avatar/?d=mp&s=200';
}

extension MonthTitleExtension on String {
  String get monthTitle {
    try {
      switch (this) {
        case '01':
          return LocaleKeys.month_january.tr();
        case '02':
          return LocaleKeys.month_february.tr();
        case '03':
          return LocaleKeys.month_march.tr();
        case '04':
          return LocaleKeys.month_april.tr();
        case '05':
          return LocaleKeys.month_may.tr();
        case '06':
          return LocaleKeys.month_june.tr();
        case '07':
          return LocaleKeys.month_july.tr();
        case '08':
          return LocaleKeys.month_august.tr();
        case '09':
          return LocaleKeys.month_september.tr();
        case '10':
          return LocaleKeys.month_october.tr();
        case '11':
          return LocaleKeys.month_november.tr();
        case '12':
          return LocaleKeys.month_december.tr();
        default:
          return '';
      }
    } catch (er) {
      print(er);
      return '$this';
    }
  }
}

extension LaunchExtension on String {
  Future<bool> get launchEmail => launch('mailto:$this');

  Future<bool> get launchPhone => launch('tel:$this');

  Future<bool> get launchWebsite => (contains('http')) ? launch('$this') : launch('http://$this');

  Future<bool> get launchGoogleMap => launch('http://maps.google.com/?q=$this');
}
