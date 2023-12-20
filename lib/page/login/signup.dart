import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/controller/account_controller.dart';
import 'package:weteam/data/image_date.dart';
import 'package:weteam/page/login/completed_signup.dart';

class SignUP extends StatefulWidget {
  const SignUP({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUP> {
  final TextEditingController _uidController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AccountController accountController = Get.find<AccountController>();
  bool _isPasswordMatched = false;
  bool _hasUIdBeenTouched = false; // id를 입력하기 시작 했을 때
  bool _hasPasswordBeenTouched = false; // 비밀번호를 입력하기 시작 했을 때
  bool _validatePasswordComplexity(String password) {
    String pattern =
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[\$@\$!%*?&])[A-Za-z\d\$@\$!%*?&#]{8,}';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  bool _isPasswordComplex = false;

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

    setState(() {
      _isPasswordMatched = isPasswordComplex && password == confirmPassword;
      _isPasswordComplex = isPasswordComplex;
    });

    // 비밀번호 일치 검증
    if (password == confirmPassword) {
      setState(() {
        _isPasswordMatched = true;
      });
    } else {
      setState(() {
        _isPasswordMatched = false;
      });
    }
  }

  bool _isFormValid = false; // Form 검증 상태 변수 추가

  void _validateForm() {
    bool isUIdValid =
        _uidController.text.length >= 5 && _uidController.text.length <= 11;
    bool isPasswordComplex =
        _validatePasswordComplexity(_passwordController.text);
    bool isPasswordMatched =
        _passwordController.text == _confirmPasswordController.text;
    bool isNameValid = _nameController.text.isNotEmpty;
    bool isUIdAvailable = accountController.isUIdAvailable.value;
    bool isNicknameAvailable = accountController.isNicknameAvailable.value;

    setState(() {
      _isFormValid = isUIdValid &&
          isPasswordComplex &&
          isPasswordMatched &&
          isNameValid &&
          isUIdAvailable &&
          isNicknameAvailable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'a고딕15'),
          bodyMedium: TextStyle(fontFamily: 'a고딕15'),
        ),
      ),
      child: Scaffold(
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
                  const Text(
                    '회원가입',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff767676),
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '아이디',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: TextFormField(
                            controller: _uidController, // UserId 컨트롤러 연결
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              hintText: '아이디 입력(5~11자)',
                              hintStyle: const TextStyle(fontSize: 12.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                    width: 6.0, color: Colors.grey),
                              ),
                              errorText:
                                  _hasUIdBeenTouched && // 사용자가 타이핑을 시작 했거나
                                          (_uidController.text.length < 5 ||
                                              _uidController.text.length >
                                                  11) // 조건에 안맞을 때 > 11
                                      ? '아이디는 5-11자 사이여야 합니다.'
                                      : null,
                            ),
                            onChanged: (value) {
                              _validateForm();
                              // 사용자가 타이핑을 시작하면 입력을 검증하기 시작함
                              setState(() {
                                _hasUIdBeenTouched = true;
                              });
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: GestureDetector(
                              onTap: () async {
                                // ID 중복확인
                                final uid = _uidController.text;
                                if (uid.isNotEmpty) {
                                  await accountController
                                      .checkUIdAvailability(uid);
                                  _validateForm();
                                }
                              },
                              child: Image.asset(
                                ImagePath.signupcheck,
                                height: 28.0,
                                width: 75.0,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          '비밀번호',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: TextFormField(
                            onChanged: (value) {
                              if (!_hasPasswordBeenTouched) {
                                setState(() {
                                  _hasPasswordBeenTouched =
                                      true; // 사용자가 입력을 시작했음을 표시
                                });
                                _validateForm();
                              }
                            },
                            controller: _passwordController,
                            // obscureText: true, // 비밀번호를 별표처리
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              hintText: '비밀번호(숫자, 영문, 특수문자 조합 최소 8자)',
                              hintStyle: const TextStyle(fontSize: 12.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                    width: 6.0, color: Colors.grey),
                              ),
                              errorText:
                                  _hasPasswordBeenTouched && !_isPasswordComplex
                                      ? '비밀번호는 8자 이상이며 숫자, 영문, 특수문자를 포함해야 합니다.'
                                      : null,
                            ),
                            validator: (value) {
                              if (!_validatePasswordComplexity(value ?? "")) {
                                return '비밀번호는 숫자, 영문자, 특수문자를 포함한 8자 이상이어야 합니다.';
                              }
                              if (_passwordController.text !=
                                  _confirmPasswordController.text) {
                                return '입력한 비밀번호가 서로 일치하지 않습니다.';
                              }
                              return null; // 에러가 없을 경우 null 반환
                            },
                            autovalidateMode: AutovalidateMode.disabled,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          '비밀번호 확인',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: TextFormField(
                            onChanged: (value) {
                              _validateForm();
                            },
                            controller: _confirmPasswordController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              hintText: '비밀번호(숫자, 영문, 특수문자 조합 최소 8자)',
                              hintStyle: const TextStyle(fontSize: 12.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                    width: 6.0, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Checkbox(
                            materialTapTargetSize: MaterialTapTargetSize
                                .shrinkWrap, //체크박스 기본 패딩 제거
                            activeColor: const Color(0xFFC86148),
                            value: _isPasswordMatched,
                            onChanged: (bool? newValue) {},
                          ),
                        ),
                        const Text(
                          '이름',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: TextFormField(
                            onChanged: (value) {
                              _validateForm();
                            },
                            controller: _nameController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              hintText: '이름 입력',
                              hintStyle: const TextStyle(fontSize: 12.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                    width: 6.0, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 12.0),
                          child: Text(
                            '닉네임',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: TextFormField(
                            onChanged: (value) {
                              _validateForm();
                              setState(() {});
                            },
                            controller: _nicknameController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              hintText: '닉네임 입력',
                              hintStyle: const TextStyle(fontSize: 12.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                    width: 6.0, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, right: 10.0),
                            child: GestureDetector(
                              onTap: () async {
                                // 닉네임 중복확인
                                final nickname = _nicknameController.text;
                                if (nickname.isNotEmpty) {
                                  await accountController
                                      .checkNicknameAvailability(nickname);
                                }
                                _validateForm();
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
                            onTap: _isFormValid
                                ? () async {
                                    bool signupSuccess =
                                        await accountController.signUp(
                                      _uidController.text,
                                      _nameController.text,
                                      _passwordController.text,
                                      _nicknameController.text,
                                    );
                                    if (signupSuccess) {
                                      Get.to(() => const CompletedSignUp());
                                    } else {
                                      Get.snackbar('오류', '회원가입에 실패하였습니다.');
                                    }
                                  }
                                : null, // _isFormValid가 false일 때는 onTap을 null로 설정
                            child: Image.asset(
                              _isFormValid
                                  ? ImagePath
                                      .completedbutton2 // 회원가입 조건 달성시 바뀌는 완료 버튼
                                  : ImagePath
                                      .completebutton, // 조건 미달성 완료버튼 비활성화 이미지
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
      ),
    );
  }

  @override
  void dispose() {
    _uidController.dispose();
    _passwordController.dispose();
    _nicknameController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
