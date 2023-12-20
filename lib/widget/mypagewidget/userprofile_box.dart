import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/controller/account_controller.dart';

class UserProfileBox extends StatelessWidget {
  const UserProfileBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accountController = Get.find<AccountController>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Obx(() {
            String NickName =
                accountController.currentUser.value?.nickname ?? "Guest";
            return Text(
              '$NickName님',
              style: const TextStyle(fontSize: 20.0, fontFamily: 'a고딕16'),
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: _belong(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 2.0,
            runSpacing: 5.0,
            children: [
              roleTag('# PPT 제작'),
              roleTag('# 일본어'),
              roleTag('# PPT 제작'),
            ],
          ),
        ),
      ],
    );
  }

  Widget roleTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 3.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: const Color(0xFF2296F3),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 10.0),
      ),
    );
  }

  Widget _belong() {
    return const Text('xx대 xxxxx 학부');
  }
}
