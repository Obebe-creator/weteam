import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/src/controller/checkboxcontroller.dart';
import 'package:weteam/src/data/image_date.dart';
import 'package:weteam/src/page/ladder.dart';
import 'package:weteam/src/widget/ladderwidget/countwidget.dart';

class LadderSettingPage extends StatelessWidget {
  final CheckboxController checkboxController = Get.put(CheckboxController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F5F5),
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              '사다리타기',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          centerTitle: true,
        ),
        body: _body(),
        backgroundColor: Color(0xFFF5F5F5),
      ),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 60.0, right: 50.0, left: 50.0, bottom: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '참여 인원 수',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Divider(
                  thickness: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 120.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CounterWidget(),
                  ],
                ),
                SizedBox(
                  height: 80.0,
                ),
                Obx(() => Transform.scale(
                      alignment: Alignment.centerLeft,
                      scale: 0.8,
                      child: CheckboxListTile(
                        activeColor: Color(0xFFC86148),
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        title: Text("참여자 이름 임의로 배정"),
                        value: checkboxController.isChecked1.value,
                        onChanged: (newValue) {
                          checkboxController.toggleCheckBox1();
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    )),
                Obx(() => Transform.scale(
                      alignment: Alignment.centerLeft,
                      scale: 0.8,
                      child: CheckboxListTile(
                        activeColor: Color(0xFFC86148),
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        title: Text("사다리 타기 결과를 팀플에 반영"),
                        value: checkboxController.isChecked2.value,
                        onChanged: (newValue) {
                          checkboxController.toggleCheckBox2();
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    )),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.6),
          child: GestureDetector(
            onTap: () {
              Get.to(() => LadderPage());
            },
            child: Image.asset(ImagePath.startbutton),
          ),
        ),
      ],
    );
  }
}