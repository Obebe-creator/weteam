import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weteam/src/controller/profile_controller.dart';
import 'package:weteam/src/data/image_date.dart';
import 'package:weteam/src/widget/mypagewidget/etctags.dart';
import 'package:weteam/src/widget/mypagewidget/mbtitags.dart';
import 'package:weteam/src/widget/mypagewidget/personalitytags.dart';
import 'package:weteam/src/widget/mypagewidget/postags.dart';
import 'package:weteam/src/widget/mypagewidget/specialtytags.dart';
import 'package:weteam/src/widget/tagkategorie.dart';

class Profile_Modify extends StatefulWidget {
  @override
  _Profile_ModifyState createState() => _Profile_ModifyState();
}

class _Profile_ModifyState extends State<Profile_Modify> {
  final ProfileController controller = Get.find<ProfileController>();

  Rx<File?> _selectImageFile = Rx<File?>(null);

  RxString selectedTag = ''.obs;
  RxBool showMBTITags = false.obs;
  RxBool showPOSTags = false.obs;
  RxBool showPersonalityTags = false.obs;
  RxBool showSpecialtyTags = false.obs;
  RxBool showETCTags = false.obs;

  OverlayEntry? _overlayEntry;

  _selectImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectImageFile.value = File(image.path);
      });
    }
  }

  void _showOverlay(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3), //불투명도 조절
            ),
          ),
          GestureDetector(
            onTap: _removeOverlay, // 다른 곳을 터치하면 _removeOverlay 함수를 호출
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
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Container(
                        height: 23.0,
                        child: Center(
                          child: Text(
                            '프로필 사진 설정',
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 0.8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        height: 23.0, // 원하는 높이로 설정
                        child: InkWell(
                          onTap: () {
                            _selectImage();
                            _removeOverlay();
                          },
                          child: Center(
                            child: Text(
                              '갤러리에서 사진 선택',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 0.8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        height: 23.0,
                        child: InkWell(
                          onTap: () async {
                            await _captureImage();
                          },
                          child: Center(
                            child: Text(
                              '직접 사진 찍기',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 0.8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0, bottom: 12.0),
                      child: Container(
                        height: 35.0, // 원하는 높이로 설정
                        child: InkWell(
                          onTap: _removeOverlay,
                          child: Center(
                            child: Text(
                              '기존 이미지로 변경',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
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
      ),
    );
    if (_overlayEntry != null) {
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  _captureImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _selectImageFile.value = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F5F5),
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              '내 프로필 수정하기',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          centerTitle: true,
        ),
        body: _body(context),
        backgroundColor: Color(0xFFF5F5F5),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Obx(() {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.05),
                        child: GestureDetector(
                          onTap: () {
                            _showOverlay(context);
                          },
                          child: Obx(
                            () => ClipOval(
                              child: Container(
                                color: Colors.blue,
                                width: 120.0,
                                height: 120,
                                child: _selectImageFile.value == null
                                    ? Container(
                                        child: Center(
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : Image.file(
                                        _selectImageFile.value!,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Row(
                          children: [
                            Transform.scale(
                                scale: 0.6,
                                child: Image.asset(ImagePath.mapsearch)),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none, // 텍스트 필드 아래 줄 제거
                                  hintText: '소속',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1.0, vertical: 5.0),
                        child: Container(
                          width: (Get.width),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            child: Obx(
                              () => Wrap(
                                alignment: WrapAlignment.center,
                                spacing: 15.0, // 각각의 태그 사이의 가로 간격
                                runSpacing: 8.0, // 줄 사이의 간격
                                children: [
                                  TagKategorie(
                                    text: '희망업무',
                                    isSelected: selectedTag == '희망업무',
                                    onSelected: () {
                                      setState(() {
                                        selectedTag.value = '희망업무';
                                        showPOSTags.value = true;
                                        showMBTITags.value = false;
                                        showSpecialtyTags.value = false;
                                        showPersonalityTags.value = false;
                                        showETCTags.value = false;
                                      });
                                    },
                                  ),
                                  TagKategorie(
                                    text: 'MBTI',
                                    isSelected: selectedTag == 'MBTI',
                                    onSelected: () {
                                      setState(() {
                                        selectedTag.value = 'MBTI';
                                        showPOSTags.value = false;
                                        showMBTITags.value = true;
                                        showSpecialtyTags.value = false;
                                        showPersonalityTags.value = false;
                                        showETCTags.value = false;
                                      });
                                    },
                                  ),
                                  TagKategorie(
                                    text: '특기',
                                    isSelected: selectedTag == '특기',
                                    onSelected: () {
                                      setState(() {
                                        selectedTag.value = '특기';
                                        showPOSTags.value = false;
                                        showMBTITags.value = false;
                                        showSpecialtyTags.value = true;
                                        showPersonalityTags.value = false;
                                        showETCTags.value = false;
                                      });
                                    },
                                  ),
                                  TagKategorie(
                                    text: '성격',
                                    isSelected: selectedTag == '성격',
                                    onSelected: () {
                                      setState(() {
                                        selectedTag.value = '성격';
                                        showPOSTags.value = false;
                                        showMBTITags.value = false;
                                        showSpecialtyTags.value = false;
                                        showPersonalityTags.value = true;
                                        showETCTags.value = false;
                                      });
                                    },
                                  ),
                                  TagKategorie(
                                    text: '기타',
                                    isSelected: selectedTag == '기타',
                                    onSelected: () {
                                      setState(() {
                                        selectedTag.value = '기타';
                                        showPOSTags.value = false;
                                        showMBTITags.value = false;
                                        showSpecialtyTags.value = false;
                                        showPersonalityTags.value = false;
                                        showETCTags.value = true;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (showMBTITags.value) MBTITags(), // 여기서 MBTI 태그를 표시합니다.
                      if (showPOSTags.value) PosTags(),
                      if (showSpecialtyTags.value) SpecialtyTags(),
                      if (showPersonalityTags.value) PersonalityTags(),
                      if (showETCTags.value) ETCTags(),
                    ],
                  );
                }),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(ImagePath.cancelbutton),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // 저장버튼
                  },
                  child: Image.asset(ImagePath.savebutton),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
