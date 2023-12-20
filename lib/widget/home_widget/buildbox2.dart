import 'package:flutter/material.dart';
import 'package:weteam/data/image_date.dart';

class BuildBox2 extends StatelessWidget {
  const BuildBox2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 180.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white, // Card의 기본 배경색과 동일하게 설정
          boxShadow: [
            BoxShadow(
              // 상하좌우에 그림자 적용
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4.0,
              spreadRadius: 2.0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                children: [
                  Image.asset(
                    ImagePath.emptysche,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text('이번 학기 가장 중요한 스케쥴을 고정해보세요! \n 스케쥴 추가하고 고정하기 >',
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
