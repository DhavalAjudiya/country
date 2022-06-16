import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuntry/api_calling/modal.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static List details = [];

  static Future<List<UserDetails>> userData() async {
    final url = "https://jsonplaceholder.typicode.com/posts";

    final response = await http.get(Uri.parse(url));
    print("response -----${response.body}");
    List jsonsString = convert.jsonDecode(response.body);
    log("sfdsfsf----${jsonsString}");
    return jsonsString.map((e) => UserDetails.fromJson(e)).toList();
  }
}
