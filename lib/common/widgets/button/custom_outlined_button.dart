import 'package:flutter/material.dart';
import 'package:likhitexam/common/constants/constants.dart';

/// custom outlined button widget
class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.borderColor = kPrimaryColor,
    this.textColor = kBlackColor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding + 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Container(
        constraints: const BoxConstraints(minHeight: 50),
        width: double.infinity,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: textColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            side: const BorderSide(color: kOutlineBorderColor), // disabled
          ),
          child: Text(
            label.trim(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
