import 'package:flutter/material.dart';

class Notification2 extends StatefulWidget {
  final List<dynamic> id;
  final List<dynamic> body;
  const Notification2({Key? key, required this.id, required this.body})
      : super(key: key);

  @override
  State<Notification2> createState() => _Notification2State();
}

class _Notification2State extends State<Notification2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 60, left: 10, right: 10, bottom: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          offset: Offset(1, 2),
                          blurRadius: 15)
                    ]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.id}",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        "${widget.body}",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
