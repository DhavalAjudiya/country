import 'dart:async';

import 'package:cuntry/sqflite/sq/database_helper.dart';
import 'package:cuntry/sqflite/sq/detail_page.dart';
import 'package:cuntry/sqflite/sq/modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Data List';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: BuildBody(),
      ),
    );
  }
}

class BuildBody extends StatefulWidget {
  @override
  _BuildBodyState createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<List<ListModel>>? listItems;
  List<ListModel> noteListMain = <ListModel>[];

  TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    refreshDataList();
  }

  refreshDataList() {
    setState(() {
      getAllData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 4,
            child: Column(
              children: <Widget>[
                const Text("Title :"),
                Flexible(
                  child: TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(enabled: true),
                  ),
                ),
                RaisedButton(
                  child: const Text("Add"),
                  onPressed: () {
                    validation();
                  },
                )
              ],
            ),
          ),
          Flexible(
            flex: 12,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: noteListMain.length,
              itemBuilder: (BuildContext context, int position) {
                return InkWell(
                  child: Card(
                    color: Colors.white,
                    elevation: 2.0,
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(Icons.assessment),
                      ),
                      title: Text(
                        "${noteListMain[position].title}",
                      ),
                      trailing: GestureDetector(
                        child: const Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                        onTap: () {
                          deleteData(
                            noteListMain[position].id ?? 0,
                          );
                        },
                      ),
                    ),
                  ),
                  onTap: () {
                    updateData(
                      noteListMain[position].id ?? 0,
                      noteListMain[position].title ?? "",
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void validation() {
    if (titleController.text.isNotEmpty) {
      setState(
        () {
          insertData();
          FocusScope.of(context).unfocus();
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          content: Text("Enter Some Text"),
        ),
      );
    }
    return;
  }

  void insertData() async {
    int result;
    String title = titleController.text;
    result = await databaseHelper.insertData(ListModel(title));
    print('inserted row id: $result');
    titleController.text = '';
    refreshDataList();
  }

  void getAllData() async {
    final noteMapList = await databaseHelper.getDbData();
    setState(() {
      noteListMain = noteMapList;
    });
  }

  void updateData(int id, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailsPage(id, title);
    }));
    if (result == true) {
      refreshDataList();
    }
  }

  void deleteData(int itemId) async {
    int result = await databaseHelper.deleteData(itemId);
    refreshDataList();
  }
}
