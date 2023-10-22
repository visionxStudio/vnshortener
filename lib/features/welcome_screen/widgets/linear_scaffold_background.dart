import 'package:flutter/material.dart';

import '../../../common/constants/constants.dart';
import '../../../common/utils/app_size_utils.dart';

class LinearScaffoldBackgroundWidget extends StatelessWidget {
  const LinearScaffoldBackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            linearGradientButtom,
            linearGradientTop.withOpacity(0.8),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    );
  }
}
