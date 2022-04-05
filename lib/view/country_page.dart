import 'dart:convert' as convert;
import 'dart:convert';

import 'package:cuntry/modal/countrymodal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  Countryname _countryname = Countryname();
  final url = "http://pcom.zoommapps.com:8102/NC_ZHRPAYROLL/api/Company";

  Future<List<Countryname>?> fetchData() async {
    var headers = {
      'Content-Type': 'application/json',
      'APIKEY': 'e0f472de-aaed-4354-80a9-cad5bda857a7'
    };
    final response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode({"companyno": ""}));

    print("Data===>>${response.body}");
    // return dataFromJson(response.body);

    if (response.statusCode == 200) {
      List jsonresponse = convert.jsonDecode(response.body);
      return jsonresponse.map((e) => Countryname.fromJson(e)).toList();
      print("=====>>>>>${_countryname}");
    }
  }

  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              hint: Text(
                'Selected Country',
                style: TextStyle(fontSize: 18),
              ),
              isExpanded: true,
              value: selectedCountry,
              items: _countryname.map<DropdownMenuItem<String>>((value) {
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
                  // print(selectedCountry.toString());
                  // Country selectedCountryMap = task.countries!.firstWhere(
                  //     (Country element) => selectedCountry == element.country);
                  // print('---->>>>${selectedCountryMap.states}');
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
