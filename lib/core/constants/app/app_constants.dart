class ApplicationConstants {
  static const APP_NAME = 'Betting Money Manager';
  static const String appEmail = 'bemomaapp@gmail.com';
  //static const String appWebsite = 'https://bbm.com';
  static const String googlePlay = 'play.google.com/store/apps/details?id=com.mk.betting_money_manager';
  //static const Map<String, String> appTerms = {'ru':'tmkontakt.com/ru/pravila-usloviya','us':'tmkontakt.com/en/terms-conditions'};
  static const LANG_ASSET_PATH = 'assets/lang';
  static const FONT_FAMILY = 'Roboto';
  static const SNACKBAR_DURATION = 5;
  //static const ADMOB_ANDROID = 'ca-app-pub-4750342658077094/3299286147';//real
  static const ADMOB_ANDROID = 'ca-app-pub-3940256099942544/6300978111';//test
  static const ADMOB_IOS = 'ca-app-pub-3940256099942544/2934735716';//test
}

class DbConstants{
  static const int DATABASE_LIMIT = 100;
  static const String DATABASE_TITLE = 'data.db';
  static const int DATABASE_VERSION = 1;
}

class RegexConstants {
  //static const DIGIT_REGEX = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}";
  static const DIGIT_REGEX = r'^[0-9.]+';
  static const INPUT_SHORT_LENGTH = 5;
}