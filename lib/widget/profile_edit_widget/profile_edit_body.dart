import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/controller/profile_image_controller.dart';
import 'package:weteam/data/image_date.dart';
import 'package:weteam/widget/mypagewidget/etctags.dart';
import 'package:weteam/widget/mypagewidget/mbtitags.dart';
import 'package:weteam/widget/mypagewidget/personalitytags.dart';
import 'package:weteam/widget/mypagewidget/postags.dart';
import 'package:weteam/widget/mypagewidget/specialtytags.dart';
import 'package:weteam/widget/tagkategorie.dart';

RxString selectedTag = ''.obs;
RxBool showMBTITags = false.obs;
RxBool showPOSTags = false.obs;
RxBool showPersonalityTags = false.obs;
RxBool showSpecialtyTags = false.obs;
RxBool showETCTags = false.obs;

Widget profileeditbody(BuildContext context) {
  ProfileImageController controller =
      Get.find<ProfileImageController>(); // ProfileController 인스턴스 가져오기
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
                  offset: const Offset(0, 0),
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
                          Get.find<ProfileImageController>()
                              .showOverlay(context);
                        },
                        child: Obx(
                          () => ClipOval(
                            child: Container(
                              color: Colors.blue,
                              width: 120.0,
                              height: 120,
                              child: controller.selectImageFile.value == null
                                  ? Container(
                                      child: const Center(
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : Image.file(
                                      controller.selectImageFile.value!,
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
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none, // 텍스트 필드 아래 줄 제거
                                hintText: '소속 : ex) 꿀벌대 꿀만들기 학부',
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
                      child: SizedBox(
                        width: (Get.width),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
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
                                    selectedTag.value = '희망업무';
                                    showPOSTags.value = true;
                                    showMBTITags.value = false;
                                    showSpecialtyTags.value = false;
                                    showPersonalityTags.value = false;
                                    showETCTags.value = false;
                                  },
                                ),
                                TagKategorie(
                                  text: 'MBTI',
                                  isSelected: selectedTag == 'MBTI',
                                  onSelected: () {
                                    selectedTag.value = 'MBTI';
                                    showPOSTags.value = false;
                                    showMBTITags.value = true;
                                    showSpecialtyTags.value = false;
                                    showPersonalityTags.value = false;
                                    showETCTags.value = false;
                                  },
                                ),
                                TagKategorie(
                                  text: '특기',
                                  isSelected: selectedTag == '특기',
                                  onSelected: () {
                                    selectedTag.value = '특기';
                                    showPOSTags.value = false;
                                    showMBTITags.value = false;
                                    showSpecialtyTags.value = true;
                                    showPersonalityTags.value = false;
                                    showETCTags.value = false;
                                  },
                                ),
                                TagKategorie(
                                  text: '성격',
                                  isSelected: selectedTag == '성격',
                                  onSelected: () {
                                    selectedTag.value = '성격';
                                    showPOSTags.value = false;
                                    showMBTITags.value = false;
                                    showSpecialtyTags.value = false;
                                    showPersonalityTags.value = true;
                                    showETCTags.value = false;
                                  },
                                ),
                                TagKategorie(
                                  text: '기타',
                                  isSelected: selectedTag == '기타',
                                  onSelected: () {
                                    selectedTag.value = '기타';
                                    showPOSTags.value = false;
                                    showMBTITags.value = false;
                                    showSpecialtyTags.value = false;
                                    showPersonalityTags.value = false;
                                    showETCTags.value = true;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (showMBTITags.value)
                      const MBTITags(), // 여기서 MBTI 태그를 표시합니다.
                    if (showPOSTags.value) const PosTags(),
                    if (showSpecialtyTags.value) const SpecialtyTags(),
                    if (showPersonalityTags.value) const PersonalityTags(),
                    if (showETCTags.value) const ETCTags(),
                  ],
                );
              }),
            ),
          ),
        ),
        const SizedBox(
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
