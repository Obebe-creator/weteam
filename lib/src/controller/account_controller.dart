import 'package:get/get.dart';
import 'package:weteam/src/model/user.dart';
import 'package:weteam/src/util/api_service.dart';

class AccountController extends GetxController {
  final isLoading = false.obs;
  final isUserIdAvailable = false.obs;
  final isNicknameAvailable = false.obs;
  final ApiService _apiService = ApiService();

  // 회원가입 메서드
  Future<bool> signUp(String userId, String password, String nickname) async {
    isLoading.value = true;
    try {
      var newUser =
          User(username: userId, password: password, nickname: nickname);
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

  // 로그인 메서드 추가
  Future<void> login(String username, String password) async {
    isLoading.value = true;
    try {
      await _apiService.login(username, password);
      Get.snackbar('Success', '로그인 성공');
    } catch (e) {
      Get.snackbar('Error', '로그인 실패: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> checkUserIdAvailability(String userId) async {
    try {
      isUserIdAvailable.value =
          await _apiService.checkUsernameAvailability(userId);
    } catch (e) {
      // 오류 처리
      Get.snackbar('Error', '사용자 이름 중복 확인 중 오류 발생: $e');
    }
  }

  Future<void> checkNicknameAvailability(String nickname) async {
    try {
      isNicknameAvailable.value =
          await _apiService.checkNicknameAvailability(nickname);
    } catch (e) {
      // 오류 처리
      Get.snackbar('Error', '닉네임 중복 확인 중 오류 발생: $e');
    }
  }
}