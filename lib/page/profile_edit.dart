import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/controller/profile_image_controller.dart';
import 'package:weteam/widget/profile_edit_widget/profile_edit_body.dart';

class Profile_Edit extends StatefulWidget {
  const Profile_Edit({super.key});

  @override
  _Profile_EditState createState() => _Profile_EditState();
}

class _Profile_EditState extends State<Profile_Edit> {
  final ProfileImageController controller = Get.find<ProfileImageController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
          title: const Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              '내 프로필 수정하기',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          centerTitle: true,
        ),
        body: profileeditbody(context),
        backgroundColor: const Color(0xFFF5F5F5),
      ),
    );
  }
}
