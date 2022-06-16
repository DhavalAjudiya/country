import 'package:cuntry/api_calling/api_controller.dart';
import 'package:cuntry/api_calling/firebase.dart';
import 'package:cuntry/api_calling/modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserScreen extends StatelessWidget {
  UserScreen({Key? key}) : super(key: key);
  final ApiController apiController = Get.put(ApiController());

  final UserDetails _userDetails = UserDetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () {
          //     FirebaseDB.addJourney(userDetails: _userDetails);
          //   },
          //   icon: Icon(Icons.add),
          // ),
          ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: apiController.user.value.length,
              itemBuilder: (context, index) {
                final data = apiController.user.value[index];
                print("data---?${apiController.user.length}");
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green, width: 2),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(1, 2),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${data.id}"),
                        Text("${data.userId}"),
                        Text("${data.title}"),
                        Text("${data.body}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
