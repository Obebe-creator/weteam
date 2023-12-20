import 'package:flutter/material.dart';

class ETCTags extends StatelessWidget {
  const ETCTags({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> ETCTags = [
      '토론광',
      '대면회의 선호',
      '비대면회의 선호',
      '밤샘가능',
      '주말알바',
      '평일알바',
      '책벌레',
    ];

    return SizedBox(
      width: 270.0,
      child: Wrap(
        spacing: 6.0, // 태그 사이의 가로 간격
        runSpacing: 8, // 태그 사이의 세로 간격
        children: ETCTags.map((tag) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: Colors.blue, width: 0.5),
                ),
                child: Text(
                  '# $tag',
                  style: const TextStyle(
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
