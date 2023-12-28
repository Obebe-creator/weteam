import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/controller/bottom_nav_controller.dart';
import 'package:weteam/view/home.dart';
import 'package:weteam/view/mypage.dart';
import 'package:weteam/view/schedule.dart';
import 'package:weteam/view/teamplay.dart';

import 'data/image_date.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          controller.popAction();
        },
        child: Scaffold(
          body: _body(),
          bottomNavigationBar: _bottom(),
        ),
      ),
    );
  }

  Widget _bottom() {
    print('check bottom nav');
    return NavigationBar(
      selectedIndex: controller.index,
      onDestinationSelected: (index) => controller.changeIndex(index),
      destinations: [
        NavigationDestination(
          icon: ImageData(path: ImagePath.homeOff),
          selectedIcon: ImageData(path: ImagePath.homeOn),
          label: '홈',
        ),
        NavigationDestination(
          icon: ImageData(path: ImagePath.teamOff),
          selectedIcon: ImageData(path: ImagePath.teamOn),
          label: '진행팀플',
        ),
        NavigationDestination(
          icon: ImageData(path: ImagePath.scheOff),
          selectedIcon: ImageData(path: ImagePath.scheOn),
          label: '내 스케쥴',
        ),
        NavigationDestination(
          icon: ImageData(path: ImagePath.mypageOff),
          selectedIcon: ImageData(path: ImagePath.mypageOn),
          label: '마이',
        ),
      ],
    );
  }

  Widget _body() {
    print('check body()');
    return IndexedStack(
      index: controller.index,
      children: [
        const Home(),
        const TeamPlay(),
        const Schedule(),
        MyPage(),
      ],
    );
  }
}
