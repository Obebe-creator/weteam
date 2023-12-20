import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weteam/util/overlay_utils.dart';

class ProfileImageController extends GetxController {
  final Rx<File?> _selectImageFile = Rx<File?>(null);
  Rx<File?> get selectImageFile => _selectImageFile;
  final OverlayUtils overlayUtils = OverlayUtils(); //overlay_utils 가져오기

  var profileImagePath = ''.obs;
  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery); // picker 재사용
    if (pickedFile != null) {
      profileImagePath.value = pickedFile.path;
      _selectImageFile.value = File(pickedFile.path);
    }
  }

  Future<void> captureImage() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera); // 로컬 변수명을 pickedFile로 변경
    if (pickedFile != null) {
      profileImagePath.value = pickedFile.path;
    }
  }

  void showOverlay(BuildContext context) {
    final overlayContent = Stack(
      children: <Widget>[
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.3), //불투명도 조절
          ),
        ),
        GestureDetector(
          onTap: () {
            overlayUtils.removeOverlay();
          }, // 다른 곳을 터치하면 _removeOverlay 함수를 호출
          behavior: HitTestBehavior.translucent, // 투명 영역 탭 감지
        ),
        Positioned(
          bottom: 10.0,
          left: 5.0,
          right: 5.0,
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: SizedBox(
                      height: 23.0,
                      child: Center(
                        child: Text(
                          '프로필 사진 설정',
                          style: TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      height: 23.0, // 원하는 높이로 설정
                      child: InkWell(
                        onTap: () {
                          pickImage();
                          overlayUtils.removeOverlay();
                        },
                        child: const Center(
                          child: Text(
                            '갤러리에서 사진 선택',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 0.8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      height: 23.0,
                      child: InkWell(
                        onTap: () {
                          Get.find<ProfileImageController>().captureImage();
                          overlayUtils.removeOverlay();
                        },
                        child: const Center(
                          child: Text(
                            '직접 사진 찍기',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 0.8,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 3.0, bottom: 12.0),
                    child: SizedBox(
                      height: 35.0, // 원하는 높이로 설정
                      child: InkWell(
                        // onTap: (){
                        //   // 기본 이미지 파일
                        // },
                        child: Center(
                          child: Text(
                            '기존 이미지로 변경',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    overlayUtils.showOverlay(context, overlayContent);
  }
}
