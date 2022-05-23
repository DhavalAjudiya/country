import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBars extends StatelessWidget {
  TabBars({Key? key}) : super(key: key);
  bool check = false;
  bool check1 = false;
  bool check2 = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Widget'),
          bottom: TabBar(
            onTap: (value) {
              check = !check;
              print("111111=====$check");
            },
            tabs: [
              Tab(
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text("ASADSA",
                          style: TextStyle(color: Colors.red)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  height: 60,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: check2 == true
                        ? const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0.8, 1),
                            colors: <Color>[
                              Color(0xff1f005c),
                              Color(0xff5b0060),
                              Color(0xff870160),
                              Color(0xffac255e),
                              Color(0xffca485c),
                              Color(0xffe16b5c),
                              Color(0xfff39060),
                              Color(0xffffb56b),
                            ],
                          )
                        : const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0.8, 1),
                            colors: <Color>[
                              Colors.yellow,
                              Colors.red,
                              Colors.indigo,
                              Colors.teal,
                            ],
                          ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text("ASADSA",
                          style: TextStyle(color: Colors.red)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  height: 60,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: check1 == true
                        ? const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0.8, 1),
                            colors: <Color>[
                              Color(0xff1f005c),
                              Color(0xff5b0060),
                              Color(0xff870160),
                              Color(0xffac255e),
                              Color(0xffca485c),
                              Color(0xffe16b5c),
                              Color(0xfff39060),
                              Color(0xffffb56b),
                            ],
                          )
                        : const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0.8, 1),
                            colors: <Color>[
                              Colors.yellow,
                              Colors.red,
                              Colors.indigo,
                              Colors.teal,
                            ],
                          ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text("ASADSA",
                          style: TextStyle(color: Colors.red)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  height: 60,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: check2 == true
                        ? const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0.8, 1),
                            colors: <Color>[
                              Color(0xff1f005c),
                              Color(0xff5b0060),
                              Color(0xff870160),
                              Color(0xffac255e),
                              Color(0xffca485c),
                              Color(0xffe16b5c),
                              Color(0xfff39060),
                              Color(0xffffb56b),
                            ],
                          )
                        : const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0.8, 1),
                            colors: <Color>[
                              Colors.yellow,
                              Colors.red,
                              Colors.indigo,
                              Colors.teal,
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}
