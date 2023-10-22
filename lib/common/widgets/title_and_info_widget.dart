import 'package:flutter/material.dart';
import 'package:likhitexam/common/constants/constants.dart';
import 'package:likhitexam/common/widgets/text/custom_normal_text_widget.dart';

class TitleAndInfoWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isCentered;
  const TitleAndInfoWidget({
    required this.onTap,
    required this.title,
    this.isCentered = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCentered
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NormalText(
                title,
                color: kAppBarColor,
                fontWeight: FontWeight.bold,
                fontSize: kDefaultFontSize - 4,
              ),
              GestureDetector(
                onTap: onTap,
                child: const Icon(
                  Icons.info_outline_rounded,
                  size: 16.0,
                  color: kDarkGrey,
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Opacity(
                opacity: 0,
                child: Icon(Icons.done),
              ),
              NormalText(
                title,
                color: kAppBarColor,
                fontWeight: FontWeight.bold,
                fontSize: kDefaultFontSize - 4,
              ),
              GestureDetector(
                onTap: onTap,
                child: const Icon(
                  Icons.info_outline_rounded,
                  size: 16.0,
                  color: kDarkGrey,
                ),
              ),
            ],
          );
  }
}
