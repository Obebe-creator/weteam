import 'dart:convert';
import 'package:weteam/model/profile_model.dart';
import 'package:weteam/model/user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = "http://15.164.221.170:9090/api";

  //login
  Future<String> login(String uid, String password) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"uid": uid, "password": password}),
    );
    if (response.statusCode == 200) {
      // JWT 문자열을 반환합니다.
      return response.body;
    } else {
      // 서버 응답의 본문을 출력합니다.
      print('Login failed with response: ${response.body}');
      throw Exception(
          'Failed to login with status code: ${response.statusCode}, Response: ${response.body}');
    }
  }

  //회원가입
  Future<void> signUp(User uid) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/auth/join"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(uid.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to sign up');
    }
  }

  // 아이디 중복 확인
  Future<bool> checkUIdAvailability(String uid) async {
    final response = await http.get(
      Uri.parse("$_baseUrl/auth/verify/uid/$uid"),
      headers: {"Content-Type": "application/json"},
    );
    print(response.statusCode); // 200 뜨는지 확인
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['result'];
    } else {
      throw Exception('사용할 수 없는 아이디 입니다.');
    }
  }

  // 닉네임 중복 확인
  Future<bool> checkNicknameAvailability(String nickname) async {
    final response = await http.get(
      Uri.parse("$_baseUrl/auth/verify/nickname/$nickname"),
      headers: {"Content-Type": "application/json"},
    );
    print(response.statusCode); // 200 뜨는지 확인
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['result'];
    } else {
      throw Exception('Failed to check nickname availability');
    }
  }

  // profile_edit 메소드
  Future<void> saveProfile(ProfileModel profile) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(profile.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to save profile information');
    }
  }

  Future<Map<String, dynamic>> getUserInfo(String jwt) async {
    try {
      final response = await http.get(
        Uri.parse("$_baseUrl/members"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $jwt",
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        // 응답 본문을 디코드합니다.
        Map<String, dynamic> responseJson = jsonDecode(response.body);
        // 응답에서 'result'와 'data' 필드를 확인합니다.
        if (responseJson['result'] == true && responseJson['data'] != null) {
          return responseJson['data'];
        } else {
          throw Exception('Server response does not contain valid user data.');
        }
      } else {
        throw Exception(
            'Failed to load user info with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load user info: $e');
    }
  }
}
