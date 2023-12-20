import 'package:flutter/material.dart';

class TeamplayStart extends StatelessWidget {
  const TeamplayStart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
          title: const Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              '팀플 시작하기',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          centerTitle: true,
        ),
        body: _body(),
        backgroundColor: const Color(0xFFF5F5F5),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Container(
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
        )
      ],
    );
  }
}
