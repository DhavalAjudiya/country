//
// import 'package:flutter/material.dart';
//
// class Country extends StatefulWidget {
//   static const rounteName = "/country";
//   const Country({Key? key}) : super(key: key);
//
//   @override
//   _CountryState createState() => _CountryState();
// }
//
// class _CountryState extends State<Country> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CountryCodePicker(
//           onChanged: print,
//           // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//           initialSelection: 'IT',
//           favorite: ['+39', 'FR'],
//           // optional. Shows only country name and flag
//           showCountryOnly: false,
//           // optional. Shows only country name and flag when popup is closed.
//           showOnlyCountryWhenClosed: false,
//           // optional. aligns the flag and the Text left
//           alignLeft: false,
//         ),
//       ),
//     );
//   }
// }
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/websecurityscanner/v1.dart';

class SampleScreen extends StatefulWidget {
  @override
  _SampleScreenState createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      // "email",
      // "https://www.googleapis.com/auth/drive",
      "https://www.googleapis.com/auth/contacts.readonly",
    ],
    // clientId:
    //     "526058415717-q1ej2bslkle55ij10kd129vcn5pnvq41.apps.googleusercontent.com"
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  try {
                    log("-----11111-----");
                    GoogleSignInAccount? user = await _googleSignIn.signIn();
                    print("====>>>>$user");
                    log("-----22222-----");
                    GoogleSignInAuthentication? googleSignInAuthentication =
                        await user?.authentication;
                    log("-----3333333-----");
                    String? idToken = googleSignInAuthentication?.idToken;
                    print("clintEmail$idToken");
                    log("-----4444444-----");
                    await _googleSignIn.signIn();
                    print("clintEmail${_googleSignIn.currentUser?.email}");
                    log("-----5555555-----");
                  } catch (e) {
                    log("-----6666666-----");
                    print("clintEmail===>>>>$e");
                  }
                },
                child: const Text("GOOGLE Sing"),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    GoogleSignIn _googleSignIn =
                        GoogleSignIn(scopes: ['email']);
                    GoogleSignInAccount? user = await _googleSignIn.signOut();
                    print(user);
                    GoogleSignInAuthentication? googleSignInAuthentication =
                        await user?.authentication;
                    String? idToken = googleSignInAuthentication?.idToken;
                    print("clintEmail${idToken}");
                    // await googleSignIn.signIn();
                    // print("clintEmail${googleSignIn.currentUser?.email}");
                  } catch (e) {
                    print("clintEmail${e}");
                  }
                },
                child: const Text("GOOGLE SignOut"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
