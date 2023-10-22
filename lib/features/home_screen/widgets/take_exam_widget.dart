import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:likhitexam/app_localization.dart';
import 'package:likhitexam/common/utils/app_size_utils.dart';
import 'package:likhitexam/routes/app_router.gr.dart';

import '../../../common/constants/constants.dart';
import '../../../common/widgets/size/custom_size_widget.dart';
import '../../../common/widgets/text/custom_normal_text_widget.dart';

class TakeExamWidget extends StatelessWidget {
  const TakeExamWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NormalText(
              "Biometric Test",
              fontWeight: FontWeight.bold,
            ),
            const HeightWidget(8.0),
            Container(
              height: SizeConfig.screenHeight * 0.22,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffF3F6FB),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NormalText(
                                "homepage.color_blind".tr(context),
                                color: kBlackColor,
                                fontWeight: FontWeight.bold,
                              ),
                              const HeightWidget(4.0),
                              NormalText(
                                "homepage.color_blind_desc".tr(context),
                                color: kTakeExamSubtitleColor,
                                fontWeight: FontWeight.normal,
                                fontSize: kDefaultFontSize - 3,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.router.push(const EyeTestScreenRoute());
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            width: SizeConfig.screenWidth * 0.4,
                            decoration: BoxDecoration(
                              // color: const Color(0xFF87b3f7),
                              color: kWhiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Center(
                              child: NormalText(
                                "homepage.take_test".tr(context).toUpperCase(),
                                // color: kWhiteColor,
                                color: const Color(0xFF87b3f7),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0.0,
                      bottom: 0.0,
                      child: Image.asset(
                        "assets/images/eyetest.gif",
                        height: SizeConfig.screenHeight * 0.2,
                        width: SizeConfig.screenWidth * 0.4,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
