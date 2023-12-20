import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/model/event.dart';

class CalendarController extends GetxController {
  var selectedEvents = {}.obs;

  void addEvent(DateTime date, Event event) {
    if (selectedEvents[date] != null) {
      selectedEvents[date].add(event);
    } else {
      selectedEvents[date] = [event];
    }
    update();
  }

  List<Event> getEventsForDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  Widget? buildEventMarker(DateTime date) {
    var events = getEventsForDay(date);

    List<Widget> markers = [];
    for (var i = 0; i < events.length && i < 3; i++) {
      Color eventColor = getColorForEventType(events[i].title);
      markers.add(
        _buildEventMarker(events[i].title, eventColor),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: markers,
    );
  }

  Widget _buildEventMarker(String title, Color borderColor) {
    return Container(
      margin: const EdgeInsets.only(top: 1.0),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: borderColor, width: 4.0)),
        color: Colors.grey.shade300,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 10.0,
          ),
        ),
      ),
    );
  }

  Widget buildDefaultDayWidget(DateTime day) {
    if (day.weekday == DateTime.saturday) {
      return Center(
        child: Text(
          day.day.toString(),
          style: const TextStyle(color: Colors.blue, fontFamily: 'a고딕14'),
        ),
      );
    } else if (day.weekday == DateTime.sunday) {
      return Center(
        child: Text(
          day.day.toString(),
          style: const TextStyle(color: Colors.red, fontFamily: 'a고딕14'),
        ),
      );
    } else {
      return Center(child: Text(day.day.toString()));
    }
  }

  // 날짜 셀 안에 일정 추가 test
  Widget _buildReqularMeetingMarker() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 4.0,
          height: 18.0,
          decoration: const BoxDecoration(color: Colors.blue),
        ),
        Container(
          height: 18.0,
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          child: const Center(
            child: Text(
              '정기회의',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildEventsMarker(DateTime date, List<Event> events) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blue,
    ),
    width: 16.0,
    height: 16.0,
    child: Center(
      child: Text(
        '${events.length}',
        style: const TextStyle().copyWith(
          color: Colors.white,
          fontSize: 12.0,
        ),
      ),
    ),
  );
}

Color getColorForEventType(String eventType) {
  switch (eventType) {
    case 'Regular Meeting':
      return Colors.blue;
    case 'Report Deadline':
      return Colors.green;
    case 'Personal Project':
      return Colors.red;
    default:
      return Colors.grey; // A default color if no matching event type is found
  }
}
