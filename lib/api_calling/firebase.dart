import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuntry/api_calling/modal.dart';
import 'package:flutter/material.dart';

class FirebaseDB {
  static Future<DocumentReference> addJourney(
      {required UserDetails userDetails}) async {
    final collection = FirebaseFirestore.instance.collection("journeys");
    print("firebase ---${collection.id}");
    return collection.add(userDetails.toJson());
  }

  // static Future<List> getAllJourneys() async {
  //   Query collection = FirebaseFirestore.instance.collection("journeys");
  //   collection = collection.orderBy(ParamsArgus.KEY_ADDED_AT, descending: true);
  //   QuerySnapshot snapshot = await collection.get();
  //
  //   return snapshot.docs.map((DocumentSnapshot doc) {
  //     return UserDetails.fromSnapshot(doc);
  //   }).toList();
  // }
}
