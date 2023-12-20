import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageData extends StatelessWidget {
  final String path;
  final double width;
  const ImageData({super.key, required this.path, this.width = 60});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width / Get.mediaQuery.devicePixelRatio,
    );
  }
}

class ImagePath {
  static String get homeOff => 'assets/images/bot_nav_home_off.png';
  static String get homeOn => 'assets/images/bot_nav_home_on.png';
  static String get teamOff => 'assets/images/bot_nav_team_off.png';
  static String get teamOn => 'assets/images/bot_nav_team_on.png';
  static String get scheOff => 'assets/images/bot_nav_sche_off.png';
  static String get scheOn => 'assets/images/bot_nav_sche_on.png';
  static String get mypageOff => 'assets/images/bot_nav_mypage_off.png';
  static String get mypageOn => 'assets/images/bot_nav_mypage_on.png';
  static String get bellIcon => 'assets/images/icon_bell.png';
  static String get icon2Icon => 'assets/images/icon_2.png';
  static String get dot => 'assets/images/dot.png';
  static String get emptygroup => 'assets/images/empty_group.png';
  static String get emptysche => 'assets/images/empty_sche.png';
  static String get ladder => 'assets/images/ladder.png';
  static String get tipicon => 'assets/images/tip_icon.png';
  static String get title1 => 'assets/images/title_1.png';
  static String get boxitem => 'assets/images/folder.png';
  static String get addbox => 'assets/images/add_folder.png';
  static String get addschedule => 'assets/images/add_schedule.png';
  static String get sharetext => 'assets/images/share_text.png';
  static String get downarrow => 'assets/images/downarrow.png';
  static String get miniinfo => 'assets/images/min_info.png';
  static String get arrow => 'assets/images/arrow.png';
  static String get mapsearch => 'assets/images/mapsearch.png';
  static String get cancelbutton => 'assets/images/cancelbutton.png';
  static String get savebutton => 'assets/images/savebutton.png';
  static String get startbutton => 'assets/images/startbox.png';
  static String get exlogo => 'assets/images/arsenallogo.png';
  static String get loginlogo => 'assets/images/login_logo.png';
  static String get loginbutton => 'assets/images/login_button.png';
  static String get loginbutton1 => 'assets/images/login_button1.png';
  static String get logingoogle => 'assets/images/login_google.png';
  static String get loginkakao => 'assets/images/kakao_login.png';
  static String get loginsignup => 'assets/images/sign_up.png';
  static String get signuplogo => 'assets/images/signup_logo.png';
  static String get signupcheck => 'assets/images/signup_check.png';
  static String get completebutton => 'assets/images/complete_button.png';
  static String get addschedulebutton =>
      'assets/images/add_schedule_button.png';
  static String get colorbutton => 'assets/images/choice_color.png';
  static String get iconlocation => 'assets/images/location_icon.png';
  static String get iconhashtag => 'assets/images/hashtag_icon.png';
  static String get iconalarm => 'assets/images/alarm_icon.png';
  static String get iconrecycle => 'assets/images/recycle_icon.png';
  static String get iconmemo => 'assets/images/memo_icon.png';
  static String get completedbutton2 => 'assets/images/completed_button_2.png';
  static String get tipwidget1 => 'assets/images/tipwidget1.png';
  static String get tipwidget2 => 'assets/images/tipwidget2.png';
}
