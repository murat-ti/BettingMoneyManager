enum DatabaseTables {
  BID_TABLE,
  BOOKMAKER_TABLE,
  SPORT_TABLE
}

extension DatabaseTablesExtension on DatabaseTables{
  String get rawValue {
    switch (this) {
      case DatabaseTables.BID_TABLE:
        return 'bid';
      case DatabaseTables.BOOKMAKER_TABLE:
        return 'bookmaker';
      case DatabaseTables.SPORT_TABLE:
        return 'sport';
      default:
        throw Exception('Table not found');
    }
  }
}
