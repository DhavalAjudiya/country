import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.countries,
  });

  List<Country>? countries;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "countries": List<dynamic>.from(countries!.map((x) => x.toJson())),
      };
}

class Country {
  Country({
    this.country,
    this.states,
  });

  String? country;
  List<String>? states;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        country: json["country"],
        states: List<String>.from(json["states"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "states": List<dynamic>.from(states!.map((x) => x)),
      };
}
