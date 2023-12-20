import 'package:flutter/material.dart';

class TagKategorie extends StatefulWidget {
  final String text;
  final bool isSelected; // 선택 됐는지
  final VoidCallback onSelected; // 선택 여부를 알려주는 콜백

  TagKategorie({
    required this.text,
    this.isSelected = false,
    required this.onSelected,
  });

  @override
  _TagKategorieState createState() => _TagKategorieState();
}

class _TagKategorieState extends State<TagKategorie> {
  double get fontSize => widget.isSelected ? 14.0 : 11.0;
  Color get textColor => widget.isSelected ? Colors.blue : Colors.black;

  @override
  Widget build(BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: TextStyle(fontSize: fontSize)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    double width = textPainter.size.width + 12;

    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: () {
          widget.onSelected();
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide.none,
          primary: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5.0),
        ),
        child: Text(
          widget.text,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize, color: textColor),
        ),
      ),
    );
  }
}

class TagKategorieList extends StatefulWidget {
  @override
  _TagKategorieListState createState() => _TagKategorieListState();
}

class _TagKategorieListState extends State<TagKategorieList> {
  String? selectedTag;

  @override
  Widget build(BuildContext context) {
    List<String> tags = [
      '희망업무',
      'MBTI',
      '특기',
      '설정',
      '기타',
    ];

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true, // ListView 크기가 자식의 크기에 맞게 줄어듦.
          physics: NeverScrollableScrollPhysics(), // 스크롤 기능을 비활성화
          itemCount: tags.length,
          itemBuilder: (context, index) {
            return TagKategorie(
              text: tags[index],
              isSelected: selectedTag == tags[index],
              onSelected: () {
                setState(() {
                  selectedTag = tags[index];
                });
              },
            );
          },
        ),
      ],
    );
  }
}
