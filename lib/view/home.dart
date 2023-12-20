import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/data/image_date.dart';
import 'package:weteam/page/tp_tip.dart';
import 'package:weteam/widget/home_widget/buildbox1.dart';
import 'package:weteam/widget/home_widget/buildbox2.dart';
import 'package:weteam/widget/home_widget/buildbox3.dart';
import 'package:weteam/widget/home_widget/top_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: CustomScrollView(
          slivers: <Widget>[
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return SliverList.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  ImagePath.title1,
                  width: 58.0,
                  height: 24.0,
                  fit: BoxFit.fill,
                ),
              ),
              const TopWidget(),
              const BuildBox1(),
              const SizedBox(
                height: 5.0,
              ),
              const BuildBox2(),
              const SizedBox(
                height: 5.0,
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(() => const TipPage());
                  },
                  child: const BuildBox3()),
            ],
          ),
        );
      },
    );
  }
}
