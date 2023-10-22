import 'package:flutter/material.dart';
import 'package:likhitexam/common/constants/constants.dart';
import 'package:likhitexam/common/widgets/text/custom_normal_text_widget.dart';

import '../size/custom_size_widget.dart';

/// custom raised/elevated button widget
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.disabled = false,
    this.fontsize = kDefaultFontSize,
    this.textColor,
    this.image,
    this.showImage = false,
    this.isUpper = false,
    this.height,
    this.imageHeight = 20.0,
    this.showBorder = false,
    this.shouldWorkOnDisabled = false,
    this.borderColor,
  }) : super(key: key);

  final bool isUpper;

  final VoidCallback onPressed;
  final Color? borderColor;
  final bool showBorder;
  final String label;
  final Color? backgroundColor;
  final bool disabled;
  final double fontsize;
  final Color? textColor;
  final String? image;
  final bool showImage;
  final double imageHeight;
  final double? height;
  final bool shouldWorkOnDisabled;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding / 2),
      child: Container(
        constraints: BoxConstraints(minHeight: height ?? 55),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: disabled
              ? shouldWorkOnDisabled
                  ? onPressed
                  : () {}
              : onPressed,
          style: !disabled
              ? ElevatedButton.styleFrom(
                  foregroundColor: textColor ?? kWhiteColor,
                  side: showBorder
                      ? BorderSide(
                          width: 1.0, color: borderColor ?? kborderRedColor)
                      : null,
                  backgroundColor:
                      backgroundColor ?? kPrimaryColor, // text color
                )
              : ElevatedButton.styleFrom(
                  foregroundColor: kWhiteColor,
                  backgroundColor: kLightGreyColor, // text color
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showImage
                  ? Image.asset(
                      image!,
                      height: imageHeight,
                    )
                  : const SizedBox(),
              showImage ? const WidthWidget(8.0) : const SizedBox(),
              NormalText(
                label.trim(),
                fontSize: fontsize,
                color: textColor ?? kWhiteColor,
                isUpper: true,
                isBold: true,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
