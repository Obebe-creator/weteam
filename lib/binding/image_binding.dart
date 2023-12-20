import 'package:get/get.dart';
import 'package:weteam/controller/image_controller.dart';

class ImageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ImagePickerController());
  }
}
