import 'package:flutter/material.dart';
import 'package:likhitexam/common/constants/constants.dart';
import 'package:likhitexam/common/utils/app_size_utils.dart';
import 'package:likhitexam/common/widgets/text/custom_normal_text_widget.dart';

class ExamPreferenceWidget extends StatelessWidget {
  const ExamPreferenceWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.isSelected,
    this.height = 150.0,
    this.width = 200.0,
    this.fit = BoxFit.cover,
    required this.onTap,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final bool isSelected;
  final String image;
  final double height;
  final double width;
  final BoxFit fit;
  final VoidCallback onTap;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        width: double.infinity,
        height: SizeConfig.screenHeight * 0.2,
        decoration: BoxDecoration(
            color: isSelected ? kDrawerColor1 : kUnselectedCardColor,
            borderRadius: BorderRadius.circular(16.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                      title.toUpperCase(),
                      isBold: true,
                      color: isSelected ? kWhiteColor : kDrawerColor1,
                    ),
                    NormalText(
                      subtitle,
                      fontSize: kDefaultFontSize - 2,
                      color: isSelected
                          ? kWhiteColor.withOpacity(0.8)
                          : kGreyColor,
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward,
                  color: isSelected ? kWhiteColor : kDrawerColor1,
                )
              ],
            ),
            Image.asset(
              image,
              height: height,
              width: width,
              fit: fit,
            ),
          ],
        ),
      ),
      // child: Container(
      //   margin: const EdgeInsets.symmetric(horizontal: 16.0),
      //   width: double.infinity,
      //   decoration: BoxDecoration(
      //       color: isSelected ? kPrimaryColor : const Color(0xffF3F6FB),
      //       borderRadius: BorderRadius.circular(32.0)),
      //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      //   child: Column(
      //     children: [
      //       Image.asset(
      //         image,
      //         height: height,
      //         width: width,
      //         fit: fit,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           isSelected
      //               ? const Icon(
      //                   Icons.check,
      //                   color: kWhiteColor,
      //                 )
      //               : const SizedBox(),
      //           const WidthWidget(8.0),
      //           NormalText(
      //             title.toUpperCase(),
      //             fontWeight: FontWeight.bold,
      //             color: isSelected ? kWhiteColor : kBlackColor,
      //             fontSize: kDefaultFontSize + 6,
      //           ),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
