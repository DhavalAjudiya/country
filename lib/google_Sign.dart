import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSign extends StatefulWidget {
  const GoogleSign({Key? key}) : super(key: key);

  @override
  State<GoogleSign> createState() => _GoogleSignState();
}

class _GoogleSignState extends State<GoogleSign> {
  googlelogin() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final result = await _googleSignIn.signIn();

      print("result===>>$result");
    } catch (e) {
      print("error====$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {},
            child: const Text("GOOGLE Sing"),
          ),
          ElevatedButton(
            onPressed: () async {},
            child: const Text("GOOGLE SignOut"),
          ),
        ],
      ),
    ));
  }
}
