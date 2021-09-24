enum DateTimeType {
  DATE,
  TIME,
  DATETIME,
  NOT_PARSED_DATETIME,
  SERVER_DATETIME,
  SERVER_DATE,
  NOT_PARSED_DATE,
  LAST_MODIFY,
  DAY,
  MONTH,
  YEAR,
  HOUR_MINUTE
}

extension DateTimeTypeExtension on DateTimeType {
  String get format {
    switch (this) {
      case DateTimeType.DATE:
        return 'dd/MM/yyyy';
      case DateTimeType.TIME:
        return 'HH:mm:ss';
      case DateTimeType.DATETIME:
        return 'dd/MM/yyyy HH:mm:ss';
      case DateTimeType.NOT_PARSED_DATETIME:
        return 'dd.MM.yyyy HH:mm:ss';
      case DateTimeType.SERVER_DATETIME:
        return 'yyyy-MM-dd HH:mm:ss';
      case DateTimeType.SERVER_DATE:
        return 'yyyy-MM-dd';
      case DateTimeType.NOT_PARSED_DATE:
        return 'dd.MM.yyyy';
      case DateTimeType.LAST_MODIFY:
        return 'EEE, d MMM yyyy HH:mm:ss Z';
      case DateTimeType.DAY:
        return 'dd';
      case DateTimeType.MONTH:
        return 'MM';
      case DateTimeType.YEAR:
        return 'yyyy';
      case DateTimeType.HOUR_MINUTE:
        return 'HH:mm';
      default:
        throw Exception('DateFormat Not Found');
    }
  }
}
