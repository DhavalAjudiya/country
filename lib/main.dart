import 'package:cuntry/api_calling/userscreen.dart';
import 'package:cuntry/audio_pick.dart';
import 'package:cuntry/datepicker.dart';
import 'package:cuntry/facebook_login.dart';
import 'package:cuntry/google_Sign.dart';
import 'package:cuntry/grooplist.dart';
import 'package:cuntry/image_pdf.dart';
import 'package:cuntry/keyboard_style.dart';
import 'package:cuntry/month_year%20_piker.dart';
import 'package:cuntry/sign.dart';
import 'package:cuntry/sqflite/sq_helper.dart';
import 'package:cuntry/sqflite/sq_screen.dart';
import 'package:cuntry/tab_bar.dart';
import 'package:cuntry/view/Screen.dart';
import 'package:cuntry/view/url_lunch.dart';
import 'package:cuntry/web_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final plugin = FacebookLogin(debug: true);
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(),
      theme: ThemeData(),
      // themeMode:ThemeMode() ,
      debugShowCheckedModeBanner: false,
      home: SqScreen(),
    );
  }
}
