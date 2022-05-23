import 'package:cuntry/audio_pick.dart';
import 'package:cuntry/facebook_login.dart';
import 'package:cuntry/google_Sign.dart';
import 'package:cuntry/grooplist.dart';
import 'package:cuntry/image_pdf.dart';
import 'package:cuntry/keyboard_style.dart';
import 'package:cuntry/month_year%20_piker.dart';
import 'package:cuntry/sign.dart';
import 'package:cuntry/tab_bar.dart';
import 'package:cuntry/view/Screen.dart';
import 'package:cuntry/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final plugin = FacebookLogin(debug: true);
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Signaturepad(),
    );
  }
}
