import 'package:flutter/material.dart';

class DateRangeWidget extends StatefulWidget {
  DateRangeWidget({Key? key}) : super(key: key);

  @override
  State<DateRangeWidget> createState() => _DateRangeWidgetState();
}

class _DateRangeWidgetState extends State<DateRangeWidget> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: ElevatedButton(
              child: Text(
                '${start.day}/${start.month}/${start.year}',
              ),
              onPressed: pickDateRange,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: ElevatedButton(
              child: Text(
                '${end.day}/${end.month}/${end.year}',
              ),
              onPressed: pickDateRange,
            ),
          ),
        ],
      )
    ]);
  }

  Future pickDateRange() async {
    // List<DateTime> days = [];
    // for (int i = 0;
    //     i <= dateRange.end.difference(dateRange.start).inDays;
    //     i++) {
    //   days.add(DateTime(
    //       dateRange.start.day,
    //       dateRange.start.month,
    //       dateRange.start.year,
    //       // In Dart you can set more than. 30 days, DateTime will do the trick
    //       dateRange.start.day + i));
    //   print("dateList---->${days.toString()}");
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(2019),
      lastDate: DateTime(2023),
    );
    setState(() {
      dateRange = newDateRange ?? dateRange;

      // if (newDateRange == null) return;
      // setState(() => dateRange = newDateRange);
    });
    List<DateTime> days = [];
    for (int i = 0;
        i <= dateRange.end.difference(dateRange.start).inDays;
        i++) {
      days.add(dateRange.start.add(Duration(days: i)));
      print("dateList---->${days.toString()}");
    }
  }
}
