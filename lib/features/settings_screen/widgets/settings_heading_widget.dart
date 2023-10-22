import 'package:flutter/material.dart';

import '../../../common/constants/constants.dart';
import '../../../common/widgets/text/custom_normal_text_widget.dart';

class SettingsHeadingWidget extends StatelessWidget {
  const SettingsHeadingWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            NormalText(
              title,
              fontSize: kDefaultFontSize + 2,
              fontWeight: FontWeight.bold,
              color: kDrawerColor2,
            ),
          ],
        ),
      ],
    );
  }
}
