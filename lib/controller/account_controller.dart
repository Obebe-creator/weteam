import 'package:get/get.dart';
import 'package:weteam/model/user.dart';
import 'package:weteam/util/api_service.dart';

class AccountController extends GetxController {
  final isLoading = false.obs;
  final isUIdAvailable = false.obs;
  final isNicknameAvailable = false.obs;
  final ApiService _apiService = ApiService();
  final currentUser = Rx<User?>(null); // 현재 유저 정보

  // 회원가입 메서드
  Future<bool> signUp(
    String uid,
    String username,
    String password,
    String nickname,
  ) async {
    isLoading.value = true;
    try {
      var newUser = User(
          uid: uid, password: password, username: username, nickname: nickname);
      await _apiService.signUp(newUser);
      Get.snackbar('Success', '회원가입 성공');
      return true;
    } catch (e) {
      Get.snackbar('Error', '회원가입 실패: $e');
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // 로그인 메서드
  Future<void> login(String uid, String password) async {
    isLoading.value = true;
    try {
      String jwt = await _apiService.login(uid, password);

      print('Received JWT: $jwt');

      currentUser.value = User(
        uid: uid,
        username: '',
        password: '',
        token: jwt,
      );
      await getCurrentUserInfo();
      Get.snackbar('Success', 'Login successful. JWT stored.');
    } catch (e) {
      Get.snackbar('Error', 'Login failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

//아이디 중복 확인
  Future<void> checkUIdAvailability(String uid) async {
    try {
      bool available = await _apiService.checkUIdAvailability(uid);
      isUIdAvailable.value = available;
      if (available) {
        // 아이디가 사용 가능한 경우
        Get.snackbar('성공', '아이디를 사용할 수 있습니다!');
      } else {
        // 아이디가 이미 사용 중인 경우
        Get.snackbar('오류', '이미 사용 중인 아이디입니다',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("error");
      // 오류 처리
      Get.snackbar('Error', '사용자 이름 중복 확인 중 오류 발생: $e');
    }
  }

  // 닉네임 중복 확인
  Future<void> checkNicknameAvailability(String nickname) async {
    try {
      bool available = await _apiService.checkNicknameAvailability(nickname);
      isNicknameAvailable.value = available;

      if (available) {
        //닉네임이 사용 가능한 경우
        Get.snackbar('성공', '닉네임을 사용할 수 있습니다');
      } else {
        //닉네임이 이미 사용 중인 경우
        Get.snackbar('오류', '이미 사용 중인 닉네임입니다.');
      }
    } catch (e) {
      // 오류 처리
      Get.snackbar('Error', '닉네임 중복 확인 중 오류 발생: $e');
    }
  }

  // 현재 사용자 정보 메소드
  Future<void> getCurrentUserInfo() async {
    isLoading.value = true;
    try {
      if (currentUser.value?.token != null) {
        var response = await _apiService.getUserInfo(currentUser.value!.token!);
        print('Response: $response');

        currentUser.value = User.fromJson(response);
        print('Current user nickname: ${currentUser.value?.nickname}');

        Get.snackbar('Success', 'User information updated successfully.');
      } else {
        throw Exception('Token is not available.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update user information: $e');
      print('error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
