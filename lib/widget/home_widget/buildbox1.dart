import 'package:flutter/material.dart';
import 'package:weteam/data/image_date.dart';

class BuildBox1 extends StatelessWidget {
  const BuildBox1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: double.infinity,
        height: 230.0,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '진행 중인 팀플 실시간 현황',
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.grey[600],
                  height: 1,
                ),
              ),
              const Text(
                '팀플 바로가기',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  height: 0.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Center(
                  child: Image.asset(ImagePath.emptygroup),
                ),
              ),
              const Center(
                child: Text('앗, 현재진행중인 팀플이 없어 보여요! \n 지금 팀플 추가하러 가기 >',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.asset(
                    ImagePath.dot,
                    width: 5,
                    height: 5,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
