import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/src/controller/mypage_controller.dart';
import 'package:weteam/src/data/image_date.dart';

class MyPageBox1 extends StatefulWidget {
  @override
  _MyPageBox1State createState() => _MyPageBox1State();
}

class _MyPageBox1State extends State<MyPageBox1> {
  final MyPageController controller = Get.put(MyPageController());
  final double progressValue = 0.7; // 게이지 값
  final GlobalKey _imageKey = GlobalKey(); // 팀메이트력 이미지 위치 찾아오는 Key
  OverlayEntry? _overlayEntry; // 툴팁 대신하여 만든 오버레이

  void _showOverlay(BuildContext context) {
    final RenderBox renderBox =
        _imageKey.currentContext!.findRenderObject() as RenderBox;
    final imagePosition = renderBox.localToGlobal(Offset.zero);
    final imageSize = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _removeOverlay,
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Positioned(
            top: imagePosition.dy + imageSize.height, // 툴팁 위치
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: Get.width - 20.0,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        '팀메이트력이란?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '이전 팀플 팀원들의 평가를 기반으로 집계된 평점으로, 나의 팀플 매너를 수치로 나타냅니다.',
                      style: TextStyle(),
                      maxLines: 3, // 최대 줄 설정
                      overflow: TextOverflow.ellipsis, // 글자가 넘칠 때 생략기호 표시
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: double.infinity,
        height: 250.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4.0,
              spreadRadius: 2.0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: ClipOval(
                            child: (controller
                                        .mypageImagePath.value.isNotEmpty &&
                                    controller.selectedImageFile.value != null)
                                ? Image.file(
                                    controller.selectedImageFile.value!,
                                    width: 100.0,
                                    height: 100.0,
                                  )
                                : Container(
                                    color: Colors.grey,
                                    width: 100.0,
                                    height: 100.0,
                                    child: Center(
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      );
                    }),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                'xxx님',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text('xx대 xxxxx 학부'),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Wrap(
                                direction: Axis.horizontal,
                                spacing: 2.0,
                                runSpacing: 5.0,
                                children: [
                                  _roleTag('# PPT 제작'),
                                  _roleTag('# 일본어'),
                                  _roleTag('# PPT 제작'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
              ),
              Row(
                children: [
                  Text(
                    '내 팀메이트력',
                    style: TextStyle(fontSize: 13.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 2.0,
                      vertical: 8.0,
                    ),
                    child: InkWell(
                      onTap: () {
                        _showOverlay(context);
                      },
                      child: Image.asset(
                        key: _imageKey,
                        ImagePath.miniinfo,
                        width: 16,
                        height: 16,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 10.0,
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(5.0),
                        value: progressValue,
                        backgroundColor: Colors.grey,
                        color: Color(0xFFE2583E),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-1 + 2 * progressValue, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(ImagePath.arrow),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              '${(progressValue * 100).toInt()}%',
                              style: TextStyle(
                                  color: Color(0xFFE2583E),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _roleTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 3.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Color(0xFF2296F3),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 10.0),
      ),
    );
  }
}
