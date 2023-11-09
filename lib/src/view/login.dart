import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/src/binding/signup_binding.dart';
import 'package:weteam/src/data/image_date.dart';
import 'package:weteam/src/page/login/loginpage.dart';
import 'package:weteam/src/page/login/signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImagePath.loginlogo,
              width: 180.0,
              height: 180.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60.0,
                vertical: 10.0,
              ),
              child: GestureDetector(
                  onTap: () {
                    Get.to(() => LoginPage());
                  },
                  child: Image.asset(ImagePath.loginbutton)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60.0,
                vertical: 10.0,
              ),
              child: Image.asset(ImagePath.logingoogle),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60.0,
                vertical: 10.0,
              ),
              child: Image.asset(ImagePath.loginkakao),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60.0,
                vertical: 10.0,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => SignUP(), binding: LoginBinding());
                },
                child: Image.asset(ImagePath.loginsignup),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
