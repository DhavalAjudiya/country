import 'package:cuntry/asd.dart';
import 'package:cuntry/calendar_event.dart';
import 'package:cuntry/sign.dart';
import 'package:cuntry/view/Screen.dart';
import 'package:cuntry/view/frist.dart';
import 'package:flutter/material.dart';

import 'button.dart';
import 'google_celandar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Signaturepad(),
    );
  }
}
