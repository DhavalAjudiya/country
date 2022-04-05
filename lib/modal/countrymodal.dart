

import 'dart:convert';

List<Countryname> countrynameFromJson(String str) => List<Countryname>.from(
    json.decode(str).map((x) => Countryname.fromJson(x)));

String countrynameToJson(List<Countryname> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Countryname {
  Countryname({
    this.companyNo,
    this.companyName,
  });

  String? companyNo;
  String? companyName;

  factory Countryname.fromJson(Map<String, dynamic> json) => Countryname(
        companyNo: json["CompanyNo"],
        companyName: json["CompanyName"],
      );

  Map<String, dynamic> toJson() => {
        "CompanyNo": companyNo,
        "CompanyName": companyName,
      };
}
