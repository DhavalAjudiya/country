import 'dart:convert';

import 'package:cuntry/modal/modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FristScreen extends StatefulWidget {
  @override
  _FristScreenState createState() => _FristScreenState();
}

class _FristScreenState extends State<FristScreen> {
  final String baseURL =
      "https://gist.githubusercontent.com/ebaranov/41bf38fdb1a2cb19a781/raw/fb097a60427717b262d5058633590749f366bd80/gistfile1.json";

  Data task = Data();
  // String state;

  Future<List<Data>?> fetchData() async {
    final http.Response response2 = await http.get(
      Uri.parse(baseURL),
    );
    if (response2.statusCode == 200) {
      setState(() {
        task = Data.fromJson(jsonDecode(response2.body));
      });
    }
  }

  String? selectedCountry;
  String? selectedState;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                hint: const Text(
                  'Selected Country',
                  style: TextStyle(fontSize: 18),
                ),
                isExpanded: true,
                value: selectedCountry,
                items: task.countries?.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value.country,
                    child: Text(
                      '${value.country}',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                })?.toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value as String?;
                    print(selectedCountry.toString());
                    Country selectedCountryMap = task.countries!.firstWhere(
                        (Country element) =>
                            selectedCountry == element.country);
                    print('---->>>>${selectedCountryMap.states}');
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              // DropdownButton(
              //   hint: Text(
              //     'selected State',
              //     style: TextStyle(fontSize: 18),
              //   ),
              //   isExpanded: true,
              //   value: selectedState,
              //   items: task.countries?.map<DropdownMenuItem<String>>((value) {
              //     return DropdownMenuItem(
              //       value: selectedState,
              //       child: Text(),
              //     );
              //   }),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
