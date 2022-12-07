import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(const LongPressDetails());

class LongPressDetails extends StatelessWidget {
  const LongPressDetails({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LongPressCalendar(),
    );
  }
}

class LongPressCalendar extends StatefulWidget {
  const LongPressCalendar({super.key});

  @override
  _LongPressCalendarState createState() => _LongPressCalendarState();
}

class _LongPressCalendarState extends State<LongPressCalendar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SfCalendar(
            view: CalendarView.month,
            onLongPress: longPressed,
            allowedViews: const <CalendarView>[
              CalendarView.day,
              CalendarView.week,
              CalendarView.workWeek,
              CalendarView.month,
              CalendarView.timelineDay,
              CalendarView.timelineWeek,
              CalendarView.timelineWorkWeek,
              CalendarView.timelineMonth,
              CalendarView.schedule
            ],
          ),
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void longPressed(CalendarLongPressDetails calendarLongPressDetails) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(child: Text(" Long pressed")),
            content: Container(
                child: Text("Date cell ${DateFormat('dd-MMM-yyyy hh:mm a')
                        .format(calendarLongPressDetails.date!)} has been long pressed")),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('close'))
            ],
          );
        });
  }
}