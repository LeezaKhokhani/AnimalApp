import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../modules/modul.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  String database = "animal.db";
  String tableName = "animal_data";
  String colId = "id";
  String colName = "name";
  String colDescription = "description";
  String colImage = "image";
  String colType = "type";

  Database? db;

  Future<void> init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, database);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          String query =
              "CREATE TABLE IF NOT EXISTS $tableName($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, $colDescription TEXT, $colImage TEXT, $colType TEXT);";
          await db.execute(query);
        });
  }

  Future<int> insertAllData({required Animal data}) async {
    await init();
    String query =
        "INSERT INTO $tableName($colName,$colDescription,$colImage,$colType)VALUES(?,?,?,?);";
    List args = [data.name, data.description, data.image, data.type];

    int res = await db!.rawInsert(query, args);

    return res;
  }

  Future<List<Animal>> fetchAllData({required String type}) async {
    await init();
    String query = "SELECT * FROM $tableName WHERE $colType='$type';";
    List<Map<String, dynamic>> Data = await db!.rawQuery(query);

    return Data.map((e) => Animal.fromMap(e)).toList();
  }
  Future<List<Map<String, Object?>>> fetchSearchData(
      {required String name}) async {
    await init();

    String query = "SELECT * From $tableName where $colName LIKE '%$name%';";

    return await db!.rawQuery(query);
  }
}