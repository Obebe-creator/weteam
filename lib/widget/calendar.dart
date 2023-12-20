import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:weteam/controller/schedule_controller.dart';
import 'package:weteam/util/calendar_utils.dart';

class SimpleCalendar extends StatefulWidget {
  final CalendarFormat format;
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final void Function(DateTime, DateTime) onDaySelected;

  const SimpleCalendar({
    Key? key,
    required this.format,
    required this.focusedDay,
    this.selectedDay,
    required this.onDaySelected,
  }) : super(key: key);

  @override
  _SimpleCalendarState createState() => _SimpleCalendarState();
}

class _SimpleCalendarState extends State<SimpleCalendar> {
  late CalendarController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<CalendarController>();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, date, _) => controller.buildEventMarker(date),
        dowBuilder: (context, day) => CalenderUtils.getWeekdayWidget(day),
        defaultBuilder: (context, day, _) =>
            controller.buildDefaultDayWidget(day),
      ),
      locale: 'ko_KR', // 한국어
      daysOfWeekHeight: 40.0, // 요일 높이 조정
      rowHeight: 85.0, // 상하 간격
      firstDay: DateTime.utc(2000, 1, 1),
      lastDay: DateTime.utc(2100, 12, 31),
      focusedDay: widget.focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(widget.selectedDay, day);
      },
      calendarFormat: widget.format,
      startingDayOfWeek: StartingDayOfWeek.sunday, // 일요일부터 시작
      onDaySelected: ((selectedDay, newFocusedDay) {
        widget.onDaySelected(selectedDay, newFocusedDay);
      }),
      headerVisible: false, // 헤더 안보임
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekendStyle: TextStyle(color: Colors.red),
      ),

      // Calendar 내부 design
      calendarStyle: const CalendarStyle(
        cellMargin: EdgeInsets.all(0.0),
        cellPadding: EdgeInsets.all(0.0),

        defaultTextStyle: TextStyle(color: Colors.black), // 일반 텍스트 스타일
        holidayTextStyle: TextStyle(color: Colors.red), // 공휴일 텍스트 스타일
        todayDecoration: BoxDecoration(
          color: Color(0xFF666666),
          shape: BoxShape.circle,
        ),
        holidayDecoration: BoxDecoration(), // 공휴일 추가 테두리 X
        disabledTextStyle: TextStyle(color: Colors.grey),
        disabledDecoration: BoxDecoration(shape: BoxShape.circle),
      ),

      // 공휴일 설정
      holidayPredicate: (day) {
        return day.month == 1 && day.day == 1 || // 1월 1일 : 신정
            day.month == 5 && day.day == 5 || // 5월 5일 : 어린이날
            day.month == 6 && day.day == 6 || // 6월 6일 : 현충일
            day.month == 10 && day.day == 9 || // 10월 9일 : 한글날
            day.month == 12 && day.day == 25; // 12월 25일 : 크리스마스
      },
    );
  }
}
