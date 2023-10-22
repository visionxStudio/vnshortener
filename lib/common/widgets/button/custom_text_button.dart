import 'package:flutter/material.dart';

import '../../../app_localization.dart';
import '../../constants/constants.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isbold;

  const CustomTextButton(
      {Key? key, required this.text, this.isbold = false, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: onPressed,
      child: Text(
        AppLocalizations.of(context).translate(text),
        style: TextStyle(
            color: kBottonColor,
            fontSize: kDefaultFontSize - 4,
            fontWeight: !isbold ? FontWeight.normal : FontWeight.bold),
      ),
    );
  }
}
