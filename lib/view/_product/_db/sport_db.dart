import 'query/db_query.dart';
import '../_model/sport_model.dart';
import '../../../core/constants/app/app_constants.dart';
import '../enum/database_tables.dart';
import '../../../core/init/database/database_manager.dart';

class SportDb {
  static SportDb? _instance;

  static SportDb get instance {
    _instance ??= SportDb._init();
    return _instance!;
  }

  SportDb._init();

  Future<int?> insert(SportModel model) async {
    var db = await DatabaseManager.instance.database;
    try {
      return await db.insert(DatabaseTables.SPORT_TABLE.rawValue, model.toJson());
    } catch (er) {
      throw Exception('Insert problem with ' + DatabaseTables.SPORT_TABLE.rawValue + ' table');
    }
  }

  Future<SportModel?> get(int id) async {
    var db = await DatabaseManager.instance.database;
    try {
      List<Map<String, dynamic>> maps = await db.query(DatabaseTables.SPORT_TABLE.rawValue,
          where: 'sport_id = ?',
          whereArgs: [id]);
      if (maps.isNotEmpty) {
        return SportModel().fromJson(maps.first);
      }
      return null;
    } catch (er) {
      throw Exception('Update problem with ' + DatabaseTables.SPORT_TABLE.rawValue + ' table');
    }
  }

  Future<void> update(SportModel model) async {
    var db = await DatabaseManager.instance.database;
    try {
      //print(model.toJson());
      await db.update(DatabaseTables.SPORT_TABLE.rawValue, model.toJson(),
          where: 'sport_id = ?', whereArgs: [model.sportId]);
    } catch (er) {
      throw Exception('Update problem with ' + DatabaseTables.SPORT_TABLE.rawValue + ' table');
    }
  }

  Future<void> delete(int id) async {
    var db = await DatabaseManager.instance.database;
    try {
      //print(model.toJson());
      await db.delete(DatabaseTables.SPORT_TABLE.rawValue, where: 'sport_id = ?', whereArgs: [id]);
    } catch (er) {
      throw Exception('Delete problem with ' + DatabaseTables.SPORT_TABLE.rawValue + ' table');
    }
  }

  Future<List<SportModel>> fetchList(DbQuery query) async {
    var db = await DatabaseManager.instance.database;
    var offset = (query.page ?? 0) * DbConstants.DATABASE_LIMIT;
    late List<Map<String, dynamic>> items;
    try {
      items = await db.query(DatabaseTables.SPORT_TABLE.rawValue,
          orderBy: '(sport_order) ASC', limit: DbConstants.DATABASE_LIMIT, offset: offset);
    } catch (er) {
      items = [];
    }
    return SportModel().fromJsonList(items);
  }

  Future<void> reOrder(List<SportModel> list) async {
    var db = await DatabaseManager.instance.database;
    try {
      await db.transaction((txn) async {
        var batch = txn.batch();
        var index = 0;
        list.forEach((model) async {
          try {
            batch.rawUpdate(
                'UPDATE ${DatabaseTables.SPORT_TABLE.rawValue} SET sport_order = ? WHERE sport_id = ?',
                [index++, model.sportId]);

          } catch (ex) {
            throw Exception('Can not reorder ' + DatabaseTables.SPORT_TABLE.rawValue + ' table');
          }
        });
        await batch.commit(continueOnError: true, noResult: true);
      });
    } catch (er) {
      throw Exception('Problem with ' + DatabaseTables.SPORT_TABLE.rawValue + ' table');
    }
  }
}
