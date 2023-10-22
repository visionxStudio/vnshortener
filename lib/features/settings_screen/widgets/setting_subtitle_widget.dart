import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

import '../../../common/constants/constants.dart';
import '../../../common/widgets/size/custom_size_widget.dart';
import '../../../common/widgets/text/custom_normal_text_widget.dart';

class SettingSubtitleWidget extends StatelessWidget {
  const SettingSubtitleWidget({
    Key? key,
    required this.isSwitch,
    required this.onTap,
    this.backgroundColor = kWhiteColor,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;
  final bool isSwitch;
  final IconData icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(icon),
                      const WidthWidget(8.0),
                      NormalText(
                        title,
                        fontSize: kDefaultFontSize,
                        color: kSettingHeadingColor,
                        isBold: true,
                      ),
                    ],
                  ),
                  isSwitch
                      ? Switch(
                          value: true,
                          onChanged: (value) {},
                          activeColor: kPrimaryColor,
                          activeTrackColor: kPrimaryColor,
                        )
                      : const Icon(
                          FlutterRemix.arrow_right_s_line,
                          color: kGreyColor,
                        ),
                ],
              ),
            ),
            const HeightWidget(16.0),
          ],
        ),
      ),
    );
  }
}
