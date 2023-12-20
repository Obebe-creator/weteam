import 'package:flutter/material.dart';

class SpecialtyTags extends StatelessWidget {
  const SpecialtyTags({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> specialtyTags = [
      '빠른 피드백',
      '중국어',
      '영어',
      '일본어',
      '기타 외국어 능력',
      '포토샵',
      '일러스트',
      '프리미어프로',
      '에프터이펙트',
      '코딩',
      'C, C#',
      'Python',
      'JAVA',
      'JAVA Script',
    ];

    return Container(
      width: 270.0,
      child: Wrap(
        spacing: 6.0, // 태그 사이의 가로 간격
        runSpacing: 8, // 태그 사이의 세로 간격
        children: specialtyTags.map((tag) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: Colors.blue, width: 0.5),
                ),
                child: Text(
                  '# $tag',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
