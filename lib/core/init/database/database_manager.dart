import 'db_oncreate.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../../constants/app/app_constants.dart';

class DatabaseManager {
  static DatabaseManager? _instance;
  static DatabaseManager get instance {
    _instance ??= DatabaseManager._init();
    return _instance!;
  }

  DatabaseManager._init();

  Database? _database;
  Future<Database> get database async => _database ??= await _initiateDatabase();

  Future<Database> _initiateDatabase() async {
    var _documentsDirectory = await getApplicationDocumentsDirectory();
    var _path = p.join(_documentsDirectory.path, DbConstants.DATABASE_TITLE);

    return await openDatabase(_path,
        version: DbConstants.DATABASE_VERSION,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    dbCreate.forEach((String sql) {
      db.execute(sql);
    });
  }

  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
