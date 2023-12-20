import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/data/image_date.dart';
import 'package:weteam/page/add_schedule.dart';
import 'package:weteam/util/overlay_utils.dart';

void showscheduleOverlay(BuildContext context) {
  OverlayUtils overlayUtils = OverlayUtils();

  Widget overlayWidget = Material(
    color: Colors.transparent,
    child: Stack(
      children: [
        Positioned(
          child: GestureDetector(
            onTap: () {
              // This will remove the overlay when the semi-transparent background is tapped
              overlayUtils.removeOverlay();
            },
            child: Container(
              color: Colors.black.withOpacity(0.7), // Semi-transparent black
            ),
          ),
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const AddSchedule());
                    overlayUtils.removeOverlay();
                  },
                  child: Image.asset(ImagePath.addschedulebutton),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
  overlayUtils.showOverlay(context, overlayWidget);
}
