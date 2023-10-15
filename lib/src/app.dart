import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/src/controller/bottom_nav_controller.dart';
import 'package:weteam/src/view/home.dart';

import 'widget/image_date.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _body(),
        bottomNavigationBar: _bottom(),
      ),
    );
  }

  Widget _bottom() {
    return BottomNavigationBar(
      currentIndex: controller.index,
      onTap: controller.changeIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.homeOff),
            activeIcon: ImageData(path: ImagePath.homeOn),
            label: 'home'),
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.teamOff),
            activeIcon: ImageData(path: ImagePath.teamOff),
            label: 'teamplay'),
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.scheOff),
            activeIcon: ImageData(path: ImagePath.scheOn),
            label: 'schedule'),
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.mypageOff),
            activeIcon: ImageData(path: ImagePath.mypageOn),
            label: 'mypage'),
      ],
    );
  }

  Widget _body() {
    return IndexedStack(
      index: controller.index,
      children: [
        const Home(),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.blue,
        ),
      ],
    );
  }
}
