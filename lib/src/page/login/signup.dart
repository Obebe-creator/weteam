import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/src/controller/login_controller.dart';
import 'package:weteam/src/data/image_date.dart';

class SignUP extends StatefulWidget {
  const SignUP({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUP> {
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _nicknameController = TextEditingController();
  final LoginController loginController = Get.put(LoginController());
  bool _isPasswordMatched = false;
  bool _hasUserIdBeenTouched = false; // id를 입력하기 시작 했을 때
  bool _validatePasswordComplexity(String password) {
    String pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\$@\$!%*?&])[A-Za-z\d\$@\$!%*?&]{8,}';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validateAndMatchPassword);
    _confirmPasswordController.addListener(_validateAndMatchPassword);
  }

  void _validateAndMatchPassword() {
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // 비밀번호 복잡성 검증
    bool isPasswordComplex = _validatePasswordComplexity(password);

    if (!isPasswordComplex) {
      setState(() {
        _isPasswordMatched = false;
      });
      Get.snackbar('오류', '비밀번호는 숫자, 영문자, 특수문자를 포함한 8자 이상이어야 합니다.');
      return;
    }

    // 비밀번호 일치 검증
    if (password == confirmPassword) {
      setState(() {
        _isPasswordMatched = true;
      });
    } else {
      setState(() {
        _isPasswordMatched = false;
      });
      Get.snackbar('오류', '입력한 비밀번호가 서로 일치하지 않습니다.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Image.asset(ImagePath.signuplogo),
                ),
                Text(
                  '회원가입',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff767676),
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '아이디',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          controller: _userIdController, // UserId 컨트롤러 연결
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            hintText: '아이디 입력(5~11자)',
                            hintStyle: TextStyle(fontSize: 12.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  BorderSide(width: 6.0, color: Colors.grey),
                            ),
                            errorText:
                                _hasUserIdBeenTouched && // 사용자가 타이핑을 시작 했거나
                                        (_userIdController.text.length < 5 ||
                                            _userIdController.text.length >
                                                11) // 조건에 안맞을 때 > 11
                                    ? '아이디는 5-11자 사이여야 합니다.'
                                    : null,
                          ),
                          onChanged: (value) {
                            // 사용자가 타이핑을 시작하면 입력을 검증하기 시작함
                            setState(() {
                              _hasUserIdBeenTouched = true;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              ImagePath.signupcheck,
                              height: 28.0,
                              width: 75.0,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '비밀번호',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true, // 비밀번호를 별표처리
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            hintText: '비밀번호(숫자, 영문, 특수문자 조합 최소 8자)',
                            hintStyle: TextStyle(fontSize: 12.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  BorderSide(width: 6.0, color: Colors.grey),
                            ),
                            errorText: _isPasswordMatched
                                ? null
                                : '비밀번호는 8자 이상이며 숫자, 영문, 특수문자를 포함해야 합니다.',
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '비밀번호 확인',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            hintText: '비밀번호(숫자, 영문, 특수문자 조합 최소 8자)',
                            hintStyle: TextStyle(fontSize: 12.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  BorderSide(width: 6.0, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap, //체크박스 기본 패딩 제거
                          activeColor: Color(0xFFC86148),
                          value: _isPasswordMatched,
                          onChanged: (bool? newValue) {},
                        ),
                      ),
                      Text(
                        '닉네임',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            hintText: '닉네임 입력',
                            hintStyle: TextStyle(fontSize: 12.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  BorderSide(width: 6.0, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0, right: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              // 닉네임 중복확인 버튼
                            },
                            child: Image.asset(
                              ImagePath.signupcheck,
                              height: 28.0,
                              width: 75.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: GestureDetector(
                          onTap: () async {
                            if (_isPasswordMatched) {
                              await loginController.signUp(
                                _userIdController.text,
                                _passwordController.text,
                                _nicknameController.text,
                              );
                            } else {
                              Get.snackbar('오류', '비밀번호가 일치하지 않습니다.');
                            }
                          },
                          //회원가입 완료 이미지 or 위젯
                          child: Image.asset(
                            ImagePath.completebutton,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    _nicknameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
