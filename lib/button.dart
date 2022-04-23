import 'package:flutter/material.dart';

class checkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.deepPurple[400],
            title: Text("Multiple Checkbox Dynamically"),
          ),
          body: SafeArea(
              child: Center(
            child: DynamicallyCheckbox(),
          ))),
    );
  }
}

class DynamicallyCheckbox extends StatefulWidget {
  @override
  DynamicallyCheckboxState createState() => new DynamicallyCheckboxState();
}

class DynamicallyCheckboxState extends State {
  Map<String, bool> List = {
    'Egges': false,
    'Chocolates': false,
    'Flour': false,
    'Fllower': false,
    'Fruits': false,
  };

  var holder_1 = [];

  getItems() {
    List.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(holder_1);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    holder_1.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      RaisedButton(
        child: Text(" Get Checked Checkbox Items "),
        onPressed: getItems,
        color: Colors.pink,
        textColor: Colors.white,
        splashColor: Colors.grey,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
      Expanded(
        child: ListView(
          children: List.keys.map((String key) {
            return CheckboxListTile(
              title: Text(key),
              value: List[key],
              activeColor: Colors.deepPurple[400],
              checkColor: Colors.white,
              onChanged: (bool? value) {
                setState(() {
                  List[key] = value!;
                });
              },
            );
          }).toList(),
        ),
      ),
    ]);
  }
}
// class SelectAllCheckbox extends StatefulWidget {
//   const SelectAllCheckbox({Key? key}) : super(key: key);
//
//   @override
//   _SelectAllCheckboxState createState() => _SelectAllCheckboxState();
// }
//
// class _SelectAllCheckboxState extends State<SelectAllCheckbox> {
//   List<bool>? checkBoxValues;
//   List<String> userList = ['Sam', 'John', 'Rohan', 'Peter'];
//   final List<String> _selecteCategorysID = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   const Text("Select All"),
//                   Checkbox(
//                     value: checkBoxValues?[0],
//                     onChanged: (bool? newValue) {
//                       setState(() {
//                         for (var i = 0; i <= userList.length; i++) {
//                           checkBoxValues?[i] = true;
//                         }
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 450,
//               child: ListView.builder(
//                   itemCount: userList.length,
//                   itemBuilder: (context, item) {
//                     return Card(
//                         child: CheckboxListTile(
//                       selected: false,
//                       value: _selecteCategorysID.contains(userList[item]),
//                       onChanged: (bool? selected) {
//                         _onCategorySelected(selected!, userList[item]);
//                       },
//                       title: Text(userList[item]),
//                     ));
//                   }),
//             ),
//           ],
//         ));
//   }
//
//   void _onCategorySelected(bool selected, category_id) {
//     if (selected == true) {
//       setState(() {
//         _selecteCategorysID.add(category_id);
//       });
//     } else {
//       setState(() {
//         _selecteCategorysID.remove(category_id);
//       });
//     }
//   }
//
// //   void _onRememberMeChanged(bool newValue) => setState(() {
// //         rememberMe = newValue;
// //
// //         if (rememberMe) {
// //           // TODO: Here goes your functionality to select all checkbox
// //         } else {}
// //       });
// }
