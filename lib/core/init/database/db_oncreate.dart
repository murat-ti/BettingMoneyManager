import '../../../view/_product/enum/database_tables.dart';

List<String> dbCreate = [
  '''create table ${DatabaseTables.BID_TABLE.rawValue} (
        bid_id INTEGER primary key autoincrement,
        result INTEGER DEFAULT 0,
        date TEXT DEFAULT "0000-00-00",
        type INTEGER DEFAULT 0,
        bookmaker_id INTEGER DEFAULT 0,
        sport_id INTEGER DEFAULT 0,
        event TEXT,
        amount NUMERIC DEFAULT 0,
        rate NUMERIC DEFAULT 0
       )''',
  '''create table ${DatabaseTables.BOOKMAKER_TABLE.rawValue} (
        bookmaker_id INTEGER primary key autoincrement,
        bookmaker_title text not null,
        bookmaker_order INTEGER DEFAULT 1
       )''',
  '''create table ${DatabaseTables.SPORT_TABLE.rawValue} (
        sport_id INTEGER primary key autoincrement,
        sport_title text not null,
        sport_order INTEGER DEFAULT 1
       )''',
  '''INSERT INTO ${DatabaseTables.BOOKMAKER_TABLE.rawValue} (bookmaker_title) VALUES
   ('Bet365'),
   ('Betfair'),
   ('Parimatch'),
   ('Fonbet'),
   ('1xbet'),
   ('Winline'),
   ('Liga Stavok'),
   ('Marathonbet'),
   ('Casumo'),
   ('Olimp'),
   ('Pin-up'),
   ('Volcano')''',
  '''INSERT INTO ${DatabaseTables.SPORT_TABLE.rawValue} (sport_title) VALUES
   ('Football'),
   ('MMA'),
   ('Basketball'),
   ('NFL'),
   ('Boxing'),
   ('Tennis'),
   ('eSports'),
   ('Baseball'),
   ('Cricket'),
   ('Golf'),
   ('Rugby'),
   ('Horse Racing')''',
];
