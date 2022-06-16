import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqLite extends StatefulWidget {
  const SqLite({Key? key}) : super(key: key);

  @override
  State<SqLite> createState() => _SqLiteState();
}

class _SqLiteState extends State<SqLite> {
  createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'my.db');

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE Customer ("
        "id INTEGER PRIMARY KEY,"
        "first_name TEXT,"
        "last_name TEXT,"
        "email TEXT"
        ")");
  }

  @override
  void initState() {
    createDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
