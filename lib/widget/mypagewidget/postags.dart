import 'package:flutter/material.dart';

class PosTags extends StatelessWidget {
  const PosTags({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> mbtiTags = [
      '팀장',
      'PPT 제작',
      '타이핑',
      '자료조사',
      '발표',
      '촬영',
      '영상편집',
      '일러스트',
      '디자인',
    ];

    return Container(
      width: 270.0,
      child: Wrap(
        spacing: 6.0, // 태그 사이의 가로 간격
        runSpacing: 8, // 태그 사이의 세로 간격
        children: mbtiTags.map((tag) {
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
