import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/app.dart';
import 'package:weteam/controller/account_controller.dart';
import 'package:weteam/data/image_date.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isStayLoggedIn = false;
  final AccountController accountController = Get.put(AccountController());
  late String uId;
  late String password;
  final isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: const Color(0xFFFFFFFF),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 150.0,
                    ),
                    Image.asset(
                      ImagePath.loginlogo,
                      width: 180.0,
                      height: 180.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        hintText: '아이디 입력',
                        hintStyle: const TextStyle(fontSize: 12.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              const BorderSide(width: 6.0, color: Colors.grey),
                        ),
                      ),
                      onChanged: (value) {
                        uId = value;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          hintText: '비밀번호 입력',
                          hintStyle: const TextStyle(fontSize: 12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                width: 6.0, color: Colors.grey),
                          ),
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: true,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        isLoading.value = true;
                        try {
                          await accountController.login(uId, password);
                          if (accountController.currentUser.value != null) {
                            // Check if login was successful
                            Get.offAll(() => const App());
                          } else {
                            isLoading.value = false;
                          }
                        } catch (e) {
                          isLoading.value = false;
                        }
                      },
                      child: Image.asset(ImagePath.loginbutton1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeColor: const Color(0xFFC86148),
                          value: _isStayLoggedIn,
                          onChanged: (bool? value) {
                            setState(() {
                              _isStayLoggedIn = value!;
                            });
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            "로그인 유지",
                            style: TextStyle(fontSize: 12.0), // 글씨 크기 조절
                          ),
                        ),
                        const SizedBox(
                          width: 38.0,
                        ),
                        InkWell(
                          onTap: () {
                            // 아이디, 비밀번호 찾기 페이지
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text(
                              '아이디/비밀번호 찾기',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
