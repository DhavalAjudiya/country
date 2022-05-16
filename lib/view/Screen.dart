import 'dart:convert';
import 'package:cuntry/modal/modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScreenData extends StatefulWidget {
  const ScreenData({Key? key}) : super(key: key);

  @override
  _ScreenDataState createState() => _ScreenDataState();
}

class _ScreenDataState extends State<ScreenData> {
  Data data = Data();
  final url =
      "https://gist.githubusercontent.com/ebaranov/41bf38fdb1a2cb19a781/raw/fb097a60427717b262d5058633590749f366bd80/gistfile1.json";

  Future<Data?> fetchData() async {
    final response = await http.get(Uri.parse(url));

    print("Data===>>${response.body}");
    // return dataFromJson(response.body);
    if (response.statusCode == 200) {
      setState(() {
        data = Data.fromJson(jsonDecode(response.body));
      });
      print("=====>>>>>${data}");
    }
  }

  List<String> state = [];
  String? _chosenValue;
  String? stateList = '';

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cuntry "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              DropdownButton<String>(
                focusColor: Colors.white,
                value: _chosenValue,
                //elevation: 5,
                style: TextStyle(color: Colors.white),
                iconEnabledColor: Colors.black,
                items: data.countries?.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value.country,
                    child: Text(
                      "${value.country}",
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                hint: const Text(
                  "Country",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                onChanged: (value) {
                  setState(() {
                    state.clear();
                    _chosenValue = value;
                    Country selected = data.countries!.firstWhere(
                        (Country element) => _chosenValue == element.country);
                    stateList = selected.states?[0];
                    state.addAll(selected.states ?? []);
                    // print("${state.length}");
                    print('state  ===> ${selected.states}');
                  });
                },
              ),
              DropdownButton<String>(
                focusColor: Colors.white,
                value: stateList,
                //elevation: 5,
                style: TextStyle(color: Colors.white),
                iconEnabledColor: Colors.black,
                items: state.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: "${value}",
                    child: Text(
                      "${value}",
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                hint: const Text(
                  "State",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                onChanged: (value) {
                  setState(() {
                    stateList = value;
                    print("${stateList.toString()}");
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
