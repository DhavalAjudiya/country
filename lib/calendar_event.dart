import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart' as googleAPI;

import 'google_celandar.dart';

class GCEvent extends StatefulWidget {
  @override
  _GCEventState createState() => _GCEventState();
}

class _GCEventState extends State<GCEvent> {
  CalendarClient calendarClient = CalendarClient();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(Duration(days: 1));
  TextEditingController _eventName = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        "818871161409-6iajr6sonimnu0e45lg5lf762ea0n9ja.apps.googleusercontent.com",
    scopes: <String>[
      googleAPI.CalendarApi.calendarScope,
    ],
  );

  Future getGoogleEventsData() async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      GoogleSignInAccount? user = await _googleSignIn.signIn();
      print(user);
      GoogleSignInAuthentication? googleSignInAuthentication =
          await user?.authentication;
      String? idToken = googleSignInAuthentication?.idToken;
      print("clintEmail${idToken}");
      await _googleSignIn.signIn();
      print("clintEmail${_googleSignIn.currentUser?.email}");
    } catch (e) {
      print("clintEmail${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2019, 3, 5),
                        maxTime: DateTime(2200, 6, 7), onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      setState(() {
                        this.startTime = date;
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    'Event Start Time',
                    style: TextStyle(color: Colors.blue),
                  )),
              Text('$startTime'),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2019, 3, 5),
                        maxTime: DateTime(2200, 6, 7), onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      setState(() {
                        this.endTime = date;
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    'Event End Time',
                    style: TextStyle(color: Colors.blue),
                  )),
              Text('$endTime'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _eventName,
              decoration: InputDecoration(hintText: 'Enter Event name'),
            ),
          ),
          RaisedButton(
              child: Text(
                'Insert Event',
              ),
              color: Colors.grey,
              onPressed: () {
                getGoogleEventsData();
                //log('add event pressed');
                calendarClient.insert(
                  context,
                  "",
                  _eventName.text,
                  startTime,
                  endTime,
                );
                getGoogleEventsData();
              }),
        ],
      ),
    );
  }
}
