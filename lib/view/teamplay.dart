import 'package:flutter/material.dart';
import 'package:weteam/data/image_date.dart';

class TeamPlay extends StatefulWidget {
  const TeamPlay({super.key});

  @override
  _TeamPlayState createState() => _TeamPlayState();
}

class _TeamPlayState extends State<TeamPlay> {
  List<int> counts = List.generate(
      10,
      (index) => index == 5
          ? 0
          : 4); // 각 아이템의 카운트를 저장하는 리스트. index 5는 초기값 0, 나머지는 4로 설정.
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              '진행 중인 팀플',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: _body(),
        floatingActionButton: null,
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '진행 중인 팀플',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: itemCount + 1,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 20.0,
                          childAspectRatio: 1.1,
                        ),
                        itemBuilder: (context, index) {
                          if (index == itemCount) {
                            return GestureDetector(
                              onTap: () {
                                if (itemCount < counts.length) {
                                  setState(() {
                                    itemCount++;
                                  });
                                }
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      image: DecorationImage(
                                        image: AssetImage(ImagePath.addbox),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  const Text('새로운 팀플 추가하기')
                                ],
                              ),
                            );
                          }

                          return GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        image: DecorationImage(
                                          image: AssetImage(ImagePath.boxitem),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text('팀플명'),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
