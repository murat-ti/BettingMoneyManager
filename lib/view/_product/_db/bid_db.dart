import 'package:easy_localization/easy_localization.dart';

import 'query/bid_query.dart';
import '../_model/bid_model.dart';
import '../enum/database_tables.dart';
import '../../../core/init/database/database_manager.dart';

class BidDb {
  static BidDb? _instance;

  static BidDb get instance {
    _instance ??= BidDb._init();
    return _instance!;
  }

  BidDb._init();

  Future<void> insert(BidModel model) async {
    var db = await DatabaseManager.instance.database;
    try {
      //print(model.toJson());
      await db.insert(DatabaseTables.BID_TABLE.rawValue, model.toJson());
    } catch (er) {
      throw Exception('Insert problem with ' + DatabaseTables.BID_TABLE.rawValue + ' table');
    }
  }

  Future<void> update(BidModel model) async {
    var db = await DatabaseManager.instance.database;
    try {
      await db.update(DatabaseTables.BID_TABLE.rawValue, model.toJson(),
          where: 'bid_id = ?', whereArgs: [model.bidId]);
    } catch (er) {
      throw Exception('Update problem with ' + DatabaseTables.BID_TABLE.rawValue + ' table');
    }
  }

  Future<void> delete(int id) async {
    var db = await DatabaseManager.instance.database;
    try {
      await db.delete(DatabaseTables.BID_TABLE.rawValue, where: 'bid_id = ?', whereArgs: [id]);
    } catch (er) {
      throw Exception('Delete problem with ' + DatabaseTables.BID_TABLE.rawValue + ' table');
    }
  }

  Future<List<BidModel>> fetchList(BidQuery query) async {
    var db = await DatabaseManager.instance.database;
    late List<Map<String, dynamic>> items;
    try {
      //items = await db.query(DatabaseTables.BID_TABLE.rawValue, orderBy: 'date ASC');
      var args = <dynamic>[];

      var sql = 'SELECT * FROM ${DatabaseTables.BID_TABLE.rawValue}';

      if((query.year != null && query.year! > 0) && (query.month != null && query.month! > 0 && query.month! < 13)) {
        sql += ' WHERE date >= ? AND date <= ?';
        var formatter = NumberFormat('00');
        args.add('${query.year}-${formatter.format(query.month!)}-01');
        args.add('${query.year}-${formatter.format(query.month!)}-31');
      }

      sql += ' ORDER BY date ASC';
      //print(sql);
      //print(args);
      items = await db.rawQuery(sql, args);

    } catch (er) {
      items = [];
    }
    return BidModel().fromJsonList(items);
  }
}
