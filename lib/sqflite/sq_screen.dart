import 'package:cuntry/sqflite/sq_helper.dart';
import 'package:flutter/material.dart';

class SqScreen extends StatefulWidget {
  const SqScreen({Key? key}) : super(key: key);

  @override
  State<SqScreen> createState() => _SqScreenState();
}

class _SqScreenState extends State<SqScreen> {
  final dbHelper = SqDataBaseHelper.instance;

  void insertData() async {
    SqDataBaseHelper.database1 = await SqDataBaseHelper.initDatabase();
    Map<String, dynamic> row = {
      SqDataBaseHelper.columName: "dhahval",
      SqDataBaseHelper.columnAge: 22,
    };
    final id = await dbHelper.insert(row);
    print("insertData---->>>$id");
  }

  void queryall() async {
    var allrows = await dbHelper.queryAll();
    allrows.forEach((row) {
      print("queryall--->$row");
    });
  }

  void querySpecific() async {
    var allrows = await dbHelper.querySpecific(22);
    print("querySpecific--->$allrows");
  }

  void delete() async {
    var id = await dbHelper.delete(1);
    print("delete--->$id");
  }

  void upDate() async {
    var row = await dbHelper.upDate(1);
    print("upDate--->$row");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _customButton(
              data: "Insert",
              onTap: insertData,
              color: Colors.green,
            ),
            _customButton(
              data: "Query",
              onTap: queryall,
              color: Colors.amber,
            ),
            _customButton(
              data: "QuerySpecific",
              onTap: querySpecific,
              color: Colors.deepPurple,
            ),
            _customButton(
              data: "Update",
              onTap: upDate,
              color: Colors.blueAccent,
            ),
            _customButton(
              data: "Delete",
              onTap: delete,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }

  _customButton({
    final GestureTapCallback? onTap,
    String data = '',
    final Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Text(data,
                style: const TextStyle(
                  fontSize: 20,
                )),
          ),
        ),
      ),
    );
  }
}
