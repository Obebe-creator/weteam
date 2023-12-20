import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/data/image_date.dart';

class TipPage extends StatelessWidget {
  const TipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          '팀플 TIP',
          style: TextStyle(fontFamily: 'a고딕14'),
        ),
        centerTitle: true,
      ),
      body: _body(),
    ));
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            child: _topWidget(),
          ),
          _secondWidget(),
        ],
      ),
    );
  }

  Widget _topWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            '위팀\'s 꿀팁',
            style: TextStyle(fontFamily: 'a고딕16', fontSize: 18.0),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Image.asset(
                ImagePath.tipwidget1,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Image.asset(
                ImagePath.tipwidget2,
                fit: BoxFit.cover,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _secondWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 28.0, bottom: 10.0),
          child: Text(
            '더 둘러보기',
            style: TextStyle(fontFamily: 'a고딕16', fontSize: 17.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Container(
            width: (Get.width),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
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
            child: Column(
              children: [
                customContainer(
                  platform: '브런치스토리',
                  title: '<팀플이 두려운 당신에게>',
                  content: '왜 자꾸 팀플을 기피하게 되는걸까?\n그 이유를 알고 적극적인 팀플러가 되어보자!',
                ),
                customContainer(
                    platform: '네이버블로그',
                    title: '팀플 무료사이트 추천 TOP5!',
                    content:
                        '팀플이 처음이라 모든게 어려운 새내기는 주목! \n1부터 10까지 도움되는 사이트를 알려드립니다'),
                customContainer(
                    platform: '유튜브',
                    title: '고학번 화석 선배가 들려주는 팀플후기',
                    content: '야, 너두 할 수 있어 팀플,\n화석선배의 조언과 후기가 궁금하다면 클릭!'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget customContainer({
    required String platform,
    required String title,
    required String content,
    TextStyle? platformStyle,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
  }) {
    platformStyle ??= const TextStyle(fontFamily: 'a고딕12', fontSize: 12.0);
    titleStyle ??= const TextStyle(fontFamily: 'a고딕16', fontSize: 16.0);
    contentStyle ??= const TextStyle(fontFamily: 'a고딕12', fontSize: 10.0);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Container(
        width: (Get.width),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: const Color(0xFFF5F5F5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(platform, style: platformStyle),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text(title, style: titleStyle),
              ),
              Text(content, style: contentStyle),
            ],
          ),
        ),
      ),
    );
  }
}
