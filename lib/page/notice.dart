import 'package:flutter/material.dart';

class Notice extends StatelessWidget {
  Notice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Text(
            '공지사항',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        centerTitle: true,
      ),
      body: _body(),
      backgroundColor: const Color(0xFFF5F5F5),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        if (index == 0)
                          const SizedBox(
                            height: 15.0,
                          ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 3.0, top: 3.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color(0xFFF5F5F5),
                          ),
                          child: ExpansionTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[index]['notifications'][0]['title'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  items[index]['date'],
                                  style: const TextStyle(
                                      fontSize: 12.0, color: Colors.grey),
                                ),
                              ],
                            ),
                            children: <Widget>[
                              ...items[index]['notifications']
                                  .map((notification) {
                                return ListTile(
                                  title: Text(notification['title']),
                                  subtitle: notification['subtitle'] != null
                                      ? Text(notification['subtitle'])
                                      : null,
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final items = List<Map<String, dynamic>>.from([
    {
      'date': '2023.07.19',
      'notifications': [
        {
          'title': '1.1 ver 업데이트 내역 안내',
          'subtitle': 'UX/UI 팀 포트폴리오를 확인하세요!\n자세한 평가결과는 아래에서 확인해 주세요.',
        },
        {
          'title': '리더보드 별 포지션상승 완료 90%!',
          'subtitle': null,
        }
      ],
    },
    {
      'date': '2023.07.02',
      'notifications': [
        {
          'title': '🔴 정기 점검 안내',
          'subtitle': null,
        },
      ],
    },
    // 기타 다른 알림
  ]);
}
