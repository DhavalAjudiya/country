import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

List _elements = [
  {'name': 'John', 'group': 'Team A'},
  {'name': 'Will', 'group': 'Team B'},
  {'name': 'Beth', 'group': 'Team B'},
  {'name': 'Miranda', 'group': 'Team B'},
  {'name': 'Mike', 'group': 'Team B'},
  {'name': 'Danny', 'group': 'Team C'},
];

class GroupList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Grouped List View Example'),
        ),
        body: GroupedListView<dynamic, String>(
          elements: _elements,
          groupBy: (element) {
            print("elements----${element}");
            return element['group'];
          },
          groupComparator: (value1, value2) {
            print("value1----${value1}");
            print("value2----${value2}");

            return value2.compareTo(value1);
          },
          itemComparator: (item1, item2) {
            print("item1----${item1}");
            print("item2----${item2}");
            return item1['name'].compareTo(item2['name']);
          },
          order: GroupedListOrder.DESC,
          useStickyGroupSeparators: true,
          groupSeparatorBuilder: (String value) {
            print("team-------${value}");
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          },
          itemBuilder: (c, element) {
            print("element --ll------${element}");
            return Card(
              elevation: 8.0,
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  leading: const Icon(Icons.account_circle),
                  title: Text(element['name']),
                  trailing: const Icon(Icons.arrow_forward),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
