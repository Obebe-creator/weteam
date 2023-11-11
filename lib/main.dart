import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weteam/src/binding/init_binding.dart';
import 'package:weteam/src/controller/schedule_controller.dart';
import 'package:weteam/src/view/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko_KR');
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
  Get.put(CalendarController()); // 일정 추가 컨트롤러

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            // AppBar 설정
            backgroundColor: Color(0xFFF5F5F5),
            foregroundColor: Colors.black,
            elevation: 0.0,
            titleTextStyle: TextStyle(
              fontFamily: 'AGothic14',
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData()),
      home: const Login(),
      initialBinding: InitBinding(),
      debugShowCheckedModeBanner: false, // Debug 배너 없애기
    );
  }
}
