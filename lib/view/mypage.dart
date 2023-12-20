import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/controller/profile_image_controller.dart';
import 'package:weteam/page/completed_tp.dart';
import 'package:weteam/page/profile_edit.dart';
import 'package:weteam/widget/mypagewidget/userprofile.dart';

class MyPage extends StatelessWidget {
  final ProfileImageController controller = Get.put(ProfileImageController());
  MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
          title: const Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              '마이 페이지',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          centerTitle: true,
        ),
        body: _body(),
        backgroundColor: const Color(0xFFF5F5F5),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyPageBox1(),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '내 정보',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 5.0),

                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const Profile_Edit());
                    },
                    child: const Text('내 프로필 수정하기'),
                  ),
                  // 프로필 수정 페이지 만들어서 연결
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 5.0),
                  child: GestureDetector(
                      onTap: () {
                        Get.to(() => const CompletedTP());
                      },
                      child: const Text('종료된 팀플 확인')),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    thickness: 1.0,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '이용 안내',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: Text('앱 버전'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: Text('문의하기'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    thickness: 1.0,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '앱 설정',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: Text('테마 선택하기'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
