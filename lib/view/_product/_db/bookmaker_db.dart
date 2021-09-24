import 'query/db_query.dart';
import '../_model/bookmaker_model.dart';
import '../../../core/constants/app/app_constants.dart';
import '../enum/database_tables.dart';
import '../../../core/init/database/database_manager.dart';

class BookmakerDb {
  static BookmakerDb? _instance;

  static BookmakerDb get instance {
    _instance ??= BookmakerDb._init();
    return _instance!;
  }

  BookmakerDb._init();

  Future<int?> insert(BookmakerModel model) async {
    var db = await DatabaseManager.instance.database;
    try {
      //print(model.toJson());
      return await db.insert(DatabaseTables.BOOKMAKER_TABLE.rawValue, model.toJson());
    } catch (er) {
      throw Exception('Insert problem with ' + DatabaseTables.BOOKMAKER_TABLE.rawValue + ' table');
    }
  }

  Future<BookmakerModel?> get(int id) async {
    var db = await DatabaseManager.instance.database;
    try {
      List<Map<String, dynamic>> maps = await db.query(DatabaseTables.BOOKMAKER_TABLE.rawValue,
          where: 'bookmaker_id = ?',
          whereArgs: [id]);
      if (maps.isNotEmpty) {
        return BookmakerModel().fromJson(maps.first);
      }
      return null;
    } catch (er) {
      throw Exception('Update problem with ' + DatabaseTables.BOOKMAKER_TABLE.rawValue + ' table');
    }
  }

  Future<void> update(BookmakerModel model) async {
    var db = await DatabaseManager.instance.database;
    try {
      //print(model.toJson());
      await db.update(DatabaseTables.BOOKMAKER_TABLE.rawValue, model.toJson(),
          where: 'bookmaker_id = ?', whereArgs: [model.bookmakerId]);
    } catch (er) {
      throw Exception('Update problem with ' + DatabaseTables.BOOKMAKER_TABLE.rawValue + ' table');
    }
  }

  Future<void> delete(int id) async {
    var db = await DatabaseManager.instance.database;
    try {
      //print(model.toJson());
      await db.delete(DatabaseTables.BOOKMAKER_TABLE.rawValue, where: 'bookmaker_id = ?', whereArgs: [id]);
    } catch (er) {
      throw Exception('Delete problem with ' + DatabaseTables.BOOKMAKER_TABLE.rawValue + ' table');
    }
  }

  Future<List<BookmakerModel>> fetchList(DbQuery query) async {
    var db = await DatabaseManager.instance.database;
    var offset = (query.page ?? 0) * DbConstants.DATABASE_LIMIT;
    late List<Map<String, dynamic>> items;
    try {
      items = await db.query(DatabaseTables.BOOKMAKER_TABLE.rawValue,
          orderBy: '(bookmaker_order) ASC', limit: DbConstants.DATABASE_LIMIT, offset: offset);
    } catch (er) {
      items = [];
    }
    return BookmakerModel().fromJsonList(items);
  }

  Future<void> reOrder(List<BookmakerModel> list) async {
    var db = await DatabaseManager.instance.database;
    try {
      await db.transaction((txn) async {
        var batch = txn.batch();
        var index = 0;
        list.forEach((model) async {
          try {

            /*batch.update(DatabaseTables.BOOKMAKER_TABLE.rawValue, model.toJson(),
                where: 'bookmaker_id = ?', whereArgs: [model.bookmakerId], conflictAlgorithm: ConflictAlgorithm.replace);*/

            batch.rawUpdate(
                'UPDATE ${DatabaseTables.BOOKMAKER_TABLE.rawValue} SET bookmaker_order = ? WHERE bookmaker_id = ?',
                [index++, model.bookmakerId]);

          } catch (ex) {
            throw Exception('Can not reorder ' + DatabaseTables.BOOKMAKER_TABLE.rawValue + ' table');
          }
        });
        await batch.commit(continueOnError: true, noResult: true);
      });
    } catch (er) {
      throw Exception('Problem with ' + DatabaseTables.BOOKMAKER_TABLE.rawValue + ' table');
    }
  }
}
