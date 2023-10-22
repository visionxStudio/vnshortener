import 'package:flutter/material.dart';
import 'package:likhitexam/common/constants/constants.dart';

class LoadingAnimation extends StatelessWidget {
  final Color indicatorColor;
  const LoadingAnimation({Key? key, this.indicatorColor = kGreyColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50.0,
      width: double.infinity,
      child: Center(),
    );
  }
}
