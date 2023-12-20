import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyPageController extends GetxController {
  Rx<File?> selectedImageFile = Rx<File?>(null);
  var mypageImagePath = ''.obs;
  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImageFile.value = File(pickedFile.path);
    }
  }
}
