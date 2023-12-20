import 'package:flutter/material.dart';

class DatePickerDay extends StatefulWidget {
  final Function(DateTime? selectedDate) onDateChanged;
  final DateTime initialDate;

  const DatePickerDay(
      {required this.onDateChanged, required this.initialDate, Key? key})
      : super(key: key);

  @override
  State<DatePickerDay> createState() => _DatePickerDayState();
}

class _DatePickerDayState extends State<DatePickerDay> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  int _previousYear() => _selectedDate.year - 1; // 전년도
  int _nextYear() => _selectedDate.year + 1; // 다음 년도
  int _previousMonth() =>
      _selectedDate.month == 1 ? 12 : _selectedDate.month - 1; // 전 달
  int _nextMonth() =>
      _selectedDate.month == 12 ? 1 : _selectedDate.month + 1; // 다음 달

  int _previousDay() {
    DateTime previous =
        DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day)
            .subtract(const Duration(days: 1));
    return previous.day;
  } // 전 날

  int _nextDay() {
    DateTime next =
        DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day)
            .add(const Duration(days: 1));
    return next.day;
  } // 다음 날

  // 주어진 달에 있는 날의 수를 가져오는 메서드
  int _daysInMonth(int year, int month) {
    return DateUtils.getDaysInMonth(year, month);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      contentPadding: const EdgeInsets.only(top: 5.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildDateDisplay(),
          buildPickerRow(_previousYear(), _previousMonth(), _previousDay()),
          buildPickerRow(
              _selectedDate.year, _selectedDate.month, _selectedDate.day,
              isBold: true, fontSize: 18.0),
          buildPickerRow(_nextYear(), _nextMonth(), _nextDay()),
          actionButtons(),
        ],
      ),
    );
  }

  Widget buildPickerRow(int yearValue, int monthValue, int dayValue,
          {bool isBold = false, double fontSize = 14.0}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildPickerItem(yearValue,
              isYear: true, isBold: isBold, fontSize: fontSize),
          buildPickerItem(monthValue,
              isMonth: true, isBold: isBold, fontSize: fontSize),
          buildPickerItem(dayValue, isBold: isBold, fontSize: fontSize),
        ],
      );

  Widget buildDateDisplay() => Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Text(
          '${_selectedDate.year}년 ${_selectedDate.month}월 ${_selectedDate.day}일',
          style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      );

  // month : 1에서 0을 갈 때 0을 12로, 12에서 1을 갈 때 13을 1로
  Widget buildPickerItem(int value,
      {bool isYear = false,
      bool isMonth = false,
      bool isDay = false,
      bool isBold = false,
      double fontSize = 14.0}) {
    String displayValue = isYear
        ? value.toString()
        : isMonth
            ? '${value.clamp(1, 12)}'
            : value.toString();

    bool isSelected = (isYear && value == _selectedDate.year) ||
        (isMonth && value == _selectedDate.month) ||
        (!isYear && !isMonth && value == _selectedDate.day);

    return InkWell(
      onTap: () => updateSelectedDate(value, isYear: isYear, isMonth: isMonth),
      child: Text(
        displayValue,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: fontSize,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }

  bool isSelectable(int value, {bool isYear = false, bool isMonth = false}) {
    if (isYear) {
      return value >= DateTime.now().year - 100 &&
          value <= DateTime.now().year + 100;
    } else if (isMonth) {
      return value >= 1 && value <= 12;
    } else {
      return value >= 1 &&
          value <= _daysInMonth(_selectedDate.year, _selectedDate.month);
    }
  }

  void updateSelectedDate(int value,
      {required bool isYear, bool isMonth = false}) {
    setState(() {
      if (isYear) {
        _selectedDate = DateTime(value, _selectedDate.month, _selectedDate.day);
      } else if (isMonth) {
        int newYear = _selectedDate.year;
        // int newMonth = value;
        if (_selectedDate.month == 12 && value == 1) {
          // 12월에서 1월로 갈 때
          newYear++;
        } else if (_selectedDate.month == 1 && value == 12) {
          // 1월에서 12월로 갈 때
          newYear--;
        }

        // 새로운 월에 대한 날짜의 유효성 판단, 조정
        int lasDayOfMonth = _daysInMonth(newYear, value);
        int newDay = _selectedDate.day > lasDayOfMonth
            ? lasDayOfMonth
            : _selectedDate.day;

        _selectedDate = DateTime(newYear, value, _selectedDate.day);
      } else {
        _selectedDate =
            DateTime(_selectedDate.year, _selectedDate.month, value);
      }
      widget.onDateChanged(_selectedDate);
    });
  }

  Widget actionButtons() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildActionButton('취소', () => Navigator.pop(context, true)),
            buildActionButton('완료', _onDateChanged),
          ],
        ),
      );

  Widget buildActionButton(String text, VoidCallback onPressed) => Expanded(
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              foregroundColor: Colors.white, elevation: 0.0),
          child: Text(text, style: const TextStyle(color: Colors.black)),
        ),
      );

  void _onDateChanged() {
    widget.onDateChanged(_selectedDate);
    Navigator.of(context).pop();
  }
}
