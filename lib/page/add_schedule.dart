import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/data/image_date.dart';

import 'package:weteam/util/overlay_utils.dart';
import 'package:weteam/widget/datepicker/datepicker_day.dart';

class AddSchedule extends StatefulWidget {
  const AddSchedule({Key? key}) : super(key: key);

  @override
  _AddScheduleState createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  DateTime selectedDate = DateTime.now();
  DateTime focusedDate = DateTime.now();
  final OverlayUtils _overlayUtils = OverlayUtils();
  Color selectedColor = Colors.blue; // Default colo

  Future<void> _selectDate() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDay(
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
        resizeToAvoidBottomInset: false, //바텀버튼 키보드 동작 시 안올라오도록
        appBar: AppBar(
          title: const Text(
            '내 스케쥴 추가',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: const Color(0xFFF5F5F5),
          child: _body(),
        ),
        bottomNavigationBar: _bottomButtons(),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: _selectDate,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 12.0),
                            child: Row(
                              children: <Widget>[
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '제목',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 25.0),
                                    ),
                                  ),
                                ),
                                _choiceColor(),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  '시작',
                                  style: TextStyle(fontFamily: 'a고딕14'),
                                ),
                                // 시간 선택
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  '종료',
                                  style: TextStyle(fontFamily: 'a고딕14'),
                                ),
                                // 시간 선택
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Divider(
                              thickness: 1.0,
                            ),
                          ),
                          _location(),
                          _hashtag(),
                          _alarm(),
                          _recycle(),
                          _memo(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomButtons() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(ImagePath.cancelbutton),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // 저장버튼
              },
              child: Image.asset(ImagePath.savebutton),
            ),
          ),
        ],
      ),
    );
  }

  Widget _location() {
    return Row(
      children: [
        Image.asset(ImagePath.iconlocation),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '위치',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _hashtag() {
    return Row(
      children: [
        Image.asset(ImagePath.iconhashtag),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '해시태그',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _alarm() {
    return Row(
      children: [
        Image.asset(ImagePath.iconalarm),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '알람',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _recycle() {
    return Row(
      children: [
        Image.asset(ImagePath.iconrecycle),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '반복 안 함',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _memo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14.0),
          child: Image.asset(ImagePath.iconmemo),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              minLines: 12,
              maxLines: null,
              decoration: InputDecoration(
                hintText: '메모',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _choiceColor() {
    return GestureDetector(
      onTap: () {
        _overlayUtils.showOverlay(context, _selectColorOverlay());
      },
      child: Container(
        width: 15.0,
        height: 15.0,
        decoration: BoxDecoration(
          color: selectedColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _selectColorOverlay() {
    final List<Color> colors = [
      const Color(0xFFE2583E),
      const Color(0xFFE23E6F),
      const Color(0xFFDB00FF),
      const Color(0xFF553EE2),
      const Color(0xFF138AE0),
      const Color(0xFF66BCFF),
      const Color(0xFF19B96C),
      const Color(0xFFB7E23E),
      const Color(0xFFF7E431),
      const Color(0xFFFFBF5F),
      const Color(0xFFA27F55),
      const Color(0xFF88554C),
      const Color(0xFFD9D9D9),
      const Color(0xFF587E91),
    ];

    int colorCount = colors.length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white, // Container background color
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '스케쥴 색상 설정',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 18.0,
                      fontFamily: 'a고딕15',
                      color: Colors.black),
                ),
              ),
              Wrap(
                children: List.generate(colorCount, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = colors[index];
                      });
                      _overlayUtils.removeOverlay();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(
                          5.0), // Margin around each color circle
                      width: 36, // Circle diameter
                      height: 36, // Circle diameter
                      decoration: BoxDecoration(
                        color: colors[index],
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 100.0,
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      _overlayUtils.removeOverlay();
                    },
                    child: const Text(
                      '취소',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontFamily: 'a고딕12',
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
