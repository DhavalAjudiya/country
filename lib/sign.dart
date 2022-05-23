import 'dart:ui' as ui;

import 'package:cuntry/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class Signaturepad extends StatefulWidget {
  Signaturepad({Key? key}) : super(key: key);

  @override
  _SignaturepadState createState() => _SignaturepadState();
}

class _SignaturepadState extends State<Signaturepad> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  double rate = 0;
  RateMyApp _rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 3,
    minLaunches: 7,
    remindDays: 2,
    remindLaunches: 5,
    // appStoreIdentifier: '',
    // googlePlayIdentifier: '',
  );

  @override
  void initState() {
    super.initState();
    _rateMyApp.init().then((_) {
      print("----------------234234234--------");
      // TODO: Comment out this if statement to test rating dialog (Remember to uncomment)
      // if (_rateMyApp.shouldOpenDialog) {
      _rateMyApp.showStarRateDialog(
        context,
        title: 'Enjoying Flutter Rating Prompt?',
        message: 'Please leave a rating!',

        // onRatingChanged: (stars) {
        //   return [
        //     FlatButton(
        //       child: Text('Ok'),
        //       onPressed: () {
        //         if (stars != null) {
        //           _rateMyApp.doNotOpenAgain = true;
        //           _rateMyApp.save().then((v) => Navigator.pop(context));
        //
        //           if (stars <= 3) {
        //             print('Navigate to Contact Us Screen');
        //             // Navigator.push(
        //             //   context,
        //             //   MaterialPageRoute(
        //             //     builder: (_) => ContactUsScreen(),
        //             //   ),
        //             // );
        //           } else if (stars <= 5) {
        //             print('Leave a Review Dialog');
        //             // showDialog(...);
        //           }
        //         } else {
        //           Navigator.pop(context);
        //         }
        //       },
        //     ),
        //   ];
        // },
        dialogStyle: DialogStyle(
          titleAlign: TextAlign.center,
          messageAlign: TextAlign.center,
          messagePadding: EdgeInsets.only(bottom: 20.0),
        ),
        starRatingOptions: StarRatingOptions(),
      );
      // }
    });
  }

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  void _handleSaveButtonPressed() async {
    final data =
        await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    print("bytes${bytes}");
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          print("dasdasdasdasd========${bytes!.buffer.asUint8List()}");
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Container(
                color: Colors.grey[300],
                child: Image.memory(bytes.buffer.asUint8List()),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  child: SfSignaturePad(
                      key: signatureGlobalKey,
                      backgroundColor: Colors.white,
                      strokeColor: Colors.black,
                      minimumStrokeWidth: 1.0,
                      maximumStrokeWidth: 4.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)))),
          SizedBox(height: 10),
          Row(children: <Widget>[
            TextButton(
              child: Text('ToImage'),
              // onPressed: _handleSaveButtonPressed,
              onPressed: () {
                showDialog(
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              15,
                            ),
                          ),
                        ),
                        backgroundColor: Colors.white.withOpacity(0.8),
                        actions: [
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'assets/image/logo.png',
                                    width: 80,
                                    height: 40,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Enjoying FanTips',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'WorkSon',
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                text: TextSpan(
                                  spellOut: false,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                  children: [
                                    const TextSpan(
                                      text:
                                          'Tap a star to rate it on the App Store\n',
                                    ),
                                    TextSpan(
                                      text: '                       App Store',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              RatingBar.builder(
                                tapOnlyMode: true,
                                initialRating: 3,
                                minRating: 2,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  size: 10,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    rate = rating;
                                  });
                                  print("----------------$rate}");
                                },
                              ),
                              // RatingBar.builder(
                              //   initialRating: 3,
                              //   itemCount: 5,
                              //   itemBuilder: (context, index) {
                              //     switch (index) {
                              //       case 0:
                              //         return Icon(
                              //           Icons.sentiment_very_dissatisfied,
                              //           color: Colors.red,
                              //         );
                              //       case 1:
                              //         return Icon(
                              //           Icons.sentiment_dissatisfied,
                              //           color: Colors.redAccent,
                              //         );
                              //       case 2:
                              //         return Icon(
                              //           Icons.sentiment_neutral,
                              //           color: Colors.amber,
                              //         );
                              //       case 3:
                              //         return Icon(
                              //           Icons.sentiment_satisfied,
                              //           color: Colors.lightGreen,
                              //         );
                              //       case 4:
                              //         return Icon(
                              //           Icons.sentiment_very_satisfied,
                              //           color: Colors.green,
                              //         );
                              //     }
                              //     return SizedBox();
                              //   },
                              //   onRatingUpdate: (rating) {
                              //     print(rating);
                              //   },
                              // ),
                              // RatingBarIndicator(
                              //   itemPadding:
                              //       const EdgeInsets.symmetric(horizontal: 4),
                              //   rating: 5,
                              //   itemBuilder: (context, index) => const Icon(
                              //     Icons.star,
                              //     color: Colors.amber,
                              //   ),
                              //   itemCount: 5,
                              //   itemSize: 25,
                              //   direction: Axis.horizontal,
                              //   unratedColor: Colors.white,
                              //
                              // ),
                              SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                color: Colors.red,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      setState(() {
                                        rate = 2;
                                      });
                                    },
                                    child: Text(
                                      'Not Now',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueAccent,
                                        fontFamily: 'WorkSan',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueAccent,
                                        fontFamily: 'WorkSan',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                            ],
                          )
                        ],
                      );
                    },
                    context: context);
              },
            ),
            TextButton(
              child: Text('Clear'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewExample(),
                  ),
                );
              },
              // onPressed: _handleClearButtonPressed,
            ),
            Text("$rate"),
          ], mainAxisAlignment: MainAxisAlignment.spaceEvenly)
        ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center));
  }
}
