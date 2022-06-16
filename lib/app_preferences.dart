// import 'dart:async';
// import 'dart:convert';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AppPreference {
//   static late SharedPreferences _prefs;
//
//   static Future initMySharedPreferences() async {
//     _prefs = await SharedPreferences.getInstance();
//   }
//
//   void clearSharedPreferences() {
//     _prefs.clear();
//     return;
//   }
//
//   static Future setString(String key, String value) async {
//     await _prefs.setString(key, value);
//   }
//
//   static String getString(String key) {
//     final String? value = _prefs.getString(key);
//     return value ?? "";
//   }
//
//   static Future setBoolean(String key, {required bool value}) async {
//     await _prefs.setBool(key, value);
//   }
//
//   static bool getBoolean(String key) {
//     final bool? value = _prefs.getBool(key);
//     return value ?? false;
//   }
//
//   static Future setLong(String key, double value) async {
//     await _prefs.setDouble(key, value);
//   }
//
//   static double getLong(String key) {
//     final double? value = _prefs.getDouble(key);
//     return value ?? 0.0;
//   }
//
//   static Future setInt(String key, int value) async {
//     await _prefs.setInt(key, value);
//   }
//
//   static int getInt(String key) {
//     final int? value = _prefs.getInt(key);
//     return value ?? 0;
//   }
// }
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AppPreference {
//   static Future<SharedPreferences> get _instance async =>
//       _prefsInstance ??= await SharedPreferences.getInstance();
//   static SharedPreferences? _prefsInstance;
//
//   static Future<SharedPreferences?> init() async {
//     _prefsInstance = await _instance;
//     return _prefsInstance;
//   }
//
//   static String? read(String key) {
//     return _prefsInstance?.getString(key);
//   }
//
//   static Future<bool> write(String key, String value) async {
//     var prefs = await _instance;
//     return prefs.setString(key, value);
//   }
// }
