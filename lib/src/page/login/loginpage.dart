import 'package:flutter/material.dart';
import 'package:weteam/src/data/image_date.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isStayLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150.0,
                  ),
                  Image.asset(
                    ImagePath.loginlogo,
                    width: 180.0,
                    height: 180.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      hintText: '아이디 입력',
                      hintStyle: TextStyle(fontSize: 12.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(width: 6.0, color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        hintText: '비밀번호 입력',
                        hintStyle: TextStyle(fontSize: 12.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:
                              BorderSide(width: 6.0, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Image.asset(ImagePath.loginbutton1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: Color(0xFFC86148),
                        value: _isStayLoggedIn,
                        onChanged: (bool? value) {
                          setState(() {
                            _isStayLoggedIn = value!;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          "로그인 유지",
                          style: TextStyle(fontSize: 12.0), // 글씨 크기 조절
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      InkWell(
                        onTap: () {
                          // 아이디, 비밀번호 찾기 페이지
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
    );
  }
}