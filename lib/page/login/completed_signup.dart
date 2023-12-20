import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/data/image_date.dart';
import 'package:weteam/view/login.dart';

class CompletedSignUp extends StatelessWidget {
  const CompletedSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Theme(
      data: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'a고딕15'),
          bodyMedium: TextStyle(fontFamily: 'a고딕15'),
        ),
      ),
      child: Container(
        color: const Color(0xFFFFFFFF),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Image.asset(
                  ImagePath.loginlogo,
                  width: 180.0,
                  height: 180.0,
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
                child: Text(
                  'WE TEAM 회원가입이\n완료되었습니다!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Get.offAll(() => const Login());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 40.0, left: 40.0, right: 40.0),
                    child: Image.asset(ImagePath.completedbutton2),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
