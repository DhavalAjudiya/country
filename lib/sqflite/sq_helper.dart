import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqDataBaseHelper {
  SqDataBaseHelper._privateConstructor();

  static final SqDataBaseHelper instance =
      SqDataBaseHelper._privateConstructor();

  static final _dataBaseName = "persons.db";
  static final _dataBaseVersion = 1;
  static final table = "mytable";

  static final columnId = "id";
  static final columName = "name";
  static final columnAge = "age";

  static Database? database1;

  Future<Database?> get database async {
    if (database1 != null) {
      return database1;
    }
    database1 = await initDatabase();
    return database1;
  }

  static initDatabase() async {
    Directory documentation = await getApplicationDocumentsDirectory();

    String path = join(documentation.path, _dataBaseName);

    return await openDatabase(path,
        version: _dataBaseVersion, onCreate: _onCreate);
  }

  static Future _onCreate(Database db, int version) async {
    print("create table");

    await db.execute(
        'CREATE TABLE $table($columnId INTEGER PRIMARY KEY,$columName TEXT NOT NULL, $columnAge INTEGER NOT NULL)');

    await db.execute(
        '''CREATE TABLE $table ($columnId INTEGER PRIMARY KEY,$columName TEXT NOT NULL,$columnAge INTEGER NOT NULL)''');
  }

  ///  -----------  function to insert,query,update,delete  ---------------

  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }

  ///  ---------------  query all row   ------------------

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  ///  ---------------  querySpecific all row   ------------------

  Future<List<Map<String, dynamic>>> querySpecific(int age) async {
    Database? db = await instance.database;
    // var res = await db!.query(table, where: "age > ?  ", whereArgs: [age]);
    var res = await db!.rawQuery("SELECT * FROM mytable WHERE age > ?", [age]);
    return res;
  }

  ///  ---------------  Delete   ------------------

  Future<int> delete(int id) async {
    Database? db = await instance.database;
    var res = await db!.delete(table, where: "id = ? ", whereArgs: [id]);
    return res;
  }

  ///  ---------------  update   ------------------

  Future<int> upDate(int id) async {
    Database? db = await instance.database;
    var res = await db!.update(table, {"name": "ajudiya", "age": "20"},
        where: "id = ? ", whereArgs: [id]);
    return res;
  }
}
