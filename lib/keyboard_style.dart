import 'package:built_in_keyboard/language.dart';
import 'package:cuntry/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:built_in_keyboard/built_in_keyboard.dart';

class keyBoard extends StatefulWidget {
  const keyBoard({Key? key}) : super(key: key);

  @override
  State<keyBoard> createState() => _keyBoardState();
}

class _keyBoardState extends State<keyBoard> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Built In Keyboard'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: TextFormField(
              onChanged: (String) {},
              controller: textController,
              readOnly: true,
              keyboardType: TextInputType.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo[900],
                fontSize: 22.0,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(21.0, 0.0, 0.0, 0.0),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide:
                      const BorderSide(width: 3.0, color: Colors.deepOrange),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide:
                      const BorderSide(width: 3.0, color: Colors.deepOrange),
                ),
                hintText: 'try it...',
                hintStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: BuiltInKeyboard(
              language: Language.EN,
              layout: Layout.QWERTZ,
              borderRadius: BorderRadius.circular(8),
              controller: textController,
              enableLongPressUppercase: true,
              enableSpaceBar: true,
              enableBackSpace: true,
              enableCapsLock: true,
            ),
          ),
        ],
      ),
    );
  }
}
