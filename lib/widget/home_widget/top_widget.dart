import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/controller/account_controller.dart';
import 'package:weteam/data/image_date.dart';
import 'package:weteam/page/alert.dart';
import 'package:weteam/page/notice.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final accountController = Get.find<AccountController>();
    print(
        'Current user nickname: ${accountController.currentUser.value?.nickname}');

    return Padding(
      padding: const EdgeInsets.only(
          left: 16.0, right: 5.0, top: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() {
            // currentUser가 null이 아닐 때 닉네임 표시, null이면 'Guest' 표시
            String nickname =
                accountController.currentUser.value?.nickname ?? 'Guest';

            return RichText(
              text: TextSpan(
                style: const TextStyle(
                    fontSize: 20.0, color: Colors.black), // Default text style
                children: <TextSpan>[
                  const TextSpan(
                      text: '안녕하세요 ',
                      style: TextStyle(fontFamily: 'a고딕14')), // Unstyled
                  TextSpan(
                    text: nickname, // Variable to insert
                    style: const TextStyle(
                        fontFamily: 'a고딕15',
                        fontWeight: FontWeight.bold), // Bold text style
                  ),
                  const TextSpan(
                      text: ' 님!',
                      style: TextStyle(fontFamily: 'a고딕14')), // Unstyled
                ],
              ),
            );
          }),
          Row(
            children: [
              IconButton(
                icon: ImageIcon(
                  AssetImage(ImagePath.bellIcon),
                ),
                onPressed: () {
                  Get.to(() => Alert());
                },
              ),
              IconButton(
                icon: ImageIcon(
                  AssetImage(ImagePath.icon2Icon),
                ),
                onPressed: () {
                  Get.to(() => Notice());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
