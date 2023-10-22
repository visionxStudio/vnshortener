import 'package:flutter/material.dart';
import 'package:likhitexam/app_localization.dart';
import 'package:likhitexam/common/constants/constants.dart';

import '../../../common/widgets/text/custom_normal_text_widget.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    Key? key,
    required this.color,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final Color color;
  final String title;
  final String icon;
  final VoidCallback onTap;

  final double height = 120.0;

  get kgridTextColor => null;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          height: height,
          decoration: BoxDecoration(
            color: const Color(0xfff7f7f7),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
            // border: Border.all(
            //   color: kLightBorderColor,
            // ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  icon,
                  height: 40.0,
                  width: 40.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: NormalText(
                    title.tr(context),
                    color: kgridTextColor,
                    fontSize: kDefaultFontSize - 2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
