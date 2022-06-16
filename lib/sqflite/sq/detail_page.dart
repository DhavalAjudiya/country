import 'package:cuntry/sqflite/sq/database_helper.dart';
import 'package:cuntry/sqflite/sq/modal.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final int itemId;
  final String itemTitle;

  DetailsPage(this.itemId, this.itemTitle);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  TextEditingController newTextController = TextEditingController();
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    setState(() {
      newTextController.text = widget.itemTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            const Text("Edit title"),
            TextFormField(
              controller: newTextController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).primaryColorLight,
                  child: const Text(
                    'Cancel',
                    textScaleFactor: 1.5,
                  ),
                  onPressed: () {
                    validation1();
                  },
                ),
                RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).primaryColorLight,
                  child: const Text(
                    'Save',
                    textScaleFactor: 1.5,
                  ),
                  onPressed: () {
                    validation();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void updateItem(BuildContext context, int itemId, String newItem) async {
    int result =
        await databaseHelper.updateData(ListModel.withId(itemId, newItem));
    Navigator.pop(context, true);
  }

  void validation() {
    if (newTextController.text.isNotEmpty) {
      setState(() {
        updateItem(context, widget.itemId, newTextController.text);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          content: Text("Please Edit Text"),
        ),
      );
    }
    return;
  }

  void validation1() {
    if (newTextController.text.isNotEmpty) {
      setState(() {
        Navigator.pop(context, true);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          content: Text("Please Edit Text"),
        ),
      );
    }
    return;
  }
}
