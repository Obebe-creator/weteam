import 'package:flutter/material.dart';

class CompletedTP extends StatelessWidget {
  const CompletedTP({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              '종료된 팀플',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          centerTitle: true,
        ),
        body: _body(),
        backgroundColor: Color(0xFFF5F5F5),
      ),
    );
  }

  Widget _body() {
    return Column();
  }
}
