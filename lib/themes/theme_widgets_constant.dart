import 'package:flutter/material.dart';

import '../common/constants/constants.dart';

/// Elevated button style
final ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    foregroundColor: kWhiteColor, backgroundColor: kPrimaryColor,
    disabledForegroundColor: kGreyColor.withOpacity(0.38),
    disabledBackgroundColor: kGreyColor.withOpacity(0.12), // disabled
    textStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: kDefaultFontSize,
    ),
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(5.0),
    // ),
    elevation: 0,
  ),
);

/// Outlined button style
final OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: kBlackColor, backgroundColor: kWhiteColor,
    disabledForegroundColor: kGreyColor.withOpacity(0.38), // disabled
    side: const BorderSide(color: kPrimaryColor),
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: kDefaultFontSize,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
    elevation: 0,
  ),
);

///input decorator
const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  contentPadding: EdgeInsets.fromLTRB(kDefaultPadding, 0, kDefaultPadding, 0),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
    // borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
    // borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
    // borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
  hintStyle: TextStyle(
    color: kBlackColor,
    fontSize: kDefaultFontSize,
  ),
  labelStyle: TextStyle(
    color: kBlackColor,
    fontSize: kDefaultFontSize,
  ),
);
