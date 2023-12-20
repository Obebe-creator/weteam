import 'package:flutter/material.dart';

class PersonalityTags extends StatelessWidget {
  const PersonalityTags({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> personalityTags = [
      '자신감',
      '친화력',
      '낯가림',
      '꼼꼼함',
      '리더십',
      '주도적',
      '논리적',
      '계획적',
    ];

    return Container(
      width: 270.0,
      child: Wrap(
        spacing: 6.0, // 태그 사이의 가로 간격
        runSpacing: 8, // 태그 사이의 세로 간격
        children: personalityTags.map((tag) {
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
