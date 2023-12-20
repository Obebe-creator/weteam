import 'package:flutter/material.dart';
import 'package:weteam/widget/mypagewidget/tag_widget.dart';
import 'package:weteam/widget/mypagewidget/tags_constants.dart';

class MBTITags extends StatelessWidget {
  const MBTITags({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270.0,
      child: Wrap(
        spacing: 6.0,
        runSpacing: 8.0,
        children: Constants.mbtiTags
            .map((tag) => TagWidget(
                  text: tag,
                  onTap: () {
                    // Define what happens when a tag is tapped
                  },
                ))
            .toList(),
      ),
    );
  }
}
