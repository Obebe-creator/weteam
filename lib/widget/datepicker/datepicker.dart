import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final Function(DateTime? selectedDate) onDateChanged;
  final DateTime initialDate;

  const DatePicker(
      {required this.onDateChanged, required this.initialDate, Key? key})
      : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      contentPadding: const EdgeInsets.only(top: 5.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildDateDisplay(),
          buildPickerRow(_previousYear(), _previousMonth()),
          buildPickerRow(_selectedDate.year, _selectedDate.month,
              isBold: true, fontSize: 18.0),
          buildPickerRow(_nextYear(), _nextMonth()),
          actionButtons(),
        ],
      ),
    );
  }

  Widget buildPickerRow(int yearValue, int monthValue,
          {bool isBold = false, double fontSize = 14.0}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildPickerItem(yearValue,
              isYear: true, isBold: isBold, fontSize: fontSize),
          buildPickerItem(monthValue, isBold: isBold, fontSize: fontSize),
        ],
      );

  Widget buildDateDisplay() => Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Text(
          '${_selectedDate.year}년 ${_selectedDate.month}월',
          style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      );

  // 1에서 0을 갈 때 0을 12로, 12에서 1을 갈 때 13을 1로
  Widget buildPickerItem(int value,
      {bool isYear = false, bool isBold = false, double fontSize = 14.0}) {
    String displayValue = isYear ? value.toString() : '${value.clamp(1, 12)}';

    return InkWell(
      onTap: () => updateSelectedDate(value, isYear: isYear),
      child: Text(
        displayValue,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: fontSize,
          color: isSelectable(value, isYear) ? Colors.black : Colors.grey,
        ),
      ),
    );
  }

  bool isSelectable(int value, bool isYear) {
    if (isYear) {
      return value >= DateTime.now().year - 100 &&
          value <= DateTime.now().year + 100;
    } else {
      return value >= 1 && value <= 12;
    }
  }

  void updateSelectedDate(int value, {required bool isYear}) {
    setState(() {
      if (isYear) {
        _selectedDate = DateTime(value, _selectedDate.month);
      } else {
        int newYear = _selectedDate.year;
        int newMonth = value;

        if (_selectedDate.month == 12 && value == 1) {
          // 12월에서 1월로 갈 때
          newYear++;
        } else if (_selectedDate.month == 1 && value == 12) {
          // 1월에서 12월로 갈 때
          newYear--;
        } else {
          newMonth = value.clamp(1, 12);
        }

        _selectedDate = DateTime(newYear, newMonth);
      }
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
