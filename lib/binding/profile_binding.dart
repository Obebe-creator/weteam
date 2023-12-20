import 'package:get/get.dart';
import 'package:weteam/controller/profile_image_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileImageController());
  }
}
