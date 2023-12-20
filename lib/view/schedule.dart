import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:weteam/data/image_date.dart';
import 'package:weteam/model/schedule_overlay.dart';
import 'package:weteam/widget/calendar.dart';
import 'package:weteam/widget/datepicker/datepicker.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  DateTime selectedDate = DateTime.now();
  DateTime focusedDate = DateTime.now();

  final GlobalKey _calendarKey = GlobalKey();

  Future<void> _selectDate() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return DatePicker(
          onDateChanged: (selectedDate) {
            if (selectedDate != null) {
              setState(() {
                this.selectedDate = selectedDate;
                focusedDate = selectedDate;
              });
            }
          },
          initialDate: selectedDate,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
          title: const Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              '내 스케쥴',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: _body(context),
        floatingActionButton: FloatingActionButton(
          child: Image.asset(ImagePath.addschedule),
          onPressed: () => showscheduleOverlay(context),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: _selectDate,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${selectedDate.year}.${selectedDate.month}',
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Image.asset(ImagePath.downarrow),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13.0),
                  child: SizedBox(
                    height: 35.0,
                    child: Image.asset(ImagePath.sharetext),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 18.0, right: 18.0, top: 10.0, bottom: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4.0,
                      spreadRadius: 2.0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: SimpleCalendar(
                    key: _calendarKey,
                    format: CalendarFormat.month,
                    focusedDay: focusedDate,
                    onDaySelected: (selectedDay, newFocusedDay) {
                      setState(() {
                        selectedDate = selectedDay;
                        focusedDate = newFocusedDay;
                      });
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
