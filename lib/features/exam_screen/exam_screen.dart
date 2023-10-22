import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:likhitexam/app_localization.dart';
import 'package:likhitexam/common/constants/constants.dart';
import 'package:likhitexam/common/service/ads_services/banner_ads.dart';
import 'package:likhitexam/common/utils/app_size_utils.dart';
import 'package:likhitexam/common/widgets/size/custom_size_widget.dart';
import 'package:likhitexam/common/widgets/text/custom_normal_text_widget.dart';
import 'package:likhitexam/features/exam_selection/bloc/exam_selection_controller.dart';
import 'package:likhitexam/routes/app_router.gr.dart';

class ExamScreen extends StatefulWidget {
  final bool isFromPractice;
  const ExamScreen({Key? key, this.isFromPractice = false}) : super(key: key);

  @override
  ExamScreenState createState() => ExamScreenState();
}

class ExamScreenState extends State<ExamScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _quitDialogBox(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          title: Text('quit.confirm'.tr(context)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('quit.sure'.tr(context)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'quit.cancel'.tr(context),
                style: const TextStyle(color: kGreyColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('quit.exit'.tr(context)),
              onPressed: () {
                Navigator.of(context).pop(true);
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: SizeConfig.screenHeight,
            color: kDrawerColor1,
            child: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    _quitDialogBox(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Consumer(
                        builder: (context, ref, child) {
                          final examController =
                              ref.watch(examNotifierProvider);
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              NormalText(
                                "${"exam_screen.question".tr(context)} ${examController.pageViewIndex + 1}/",
                                fontSize: kDefaultFontSize + 6,
                                color: kWhiteColor,
                                fontWeight: FontWeight.w600,
                              ),
                              NormalText(
                                "${examController.randomQuestions.length}",
                                fontSize: kDefaultFontSize,
                                color: kWhiteColor,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const HeightWidget(16.0),
                Consumer(
                  builder: (context, ref, child) {
                    final examControllers = ref.watch(examNotifierProvider);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 8.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: kWhiteColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            height: 8.0,
                            width: SizeConfig.screenWidth *
                                (examControllers.pageViewIndex + 1) /
                                examControllers.randomQuestions.length,
                            decoration: BoxDecoration(
                              color: kDrawerColor2,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: SizeConfig.screenHeight * 0.8,
              width: SizeConfig.screenWidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
                color: kWhiteColor,
              ),
              child: Column(
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      final examController = ref.watch(examNotifierProvider);
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        height: SizeConfig.screenHeight * 0.6,
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (int index) {
                            examController.pageViewIndexChanged(index);
                          },
                          itemCount: examController.randomQuestions.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final question =
                                examController.randomQuestions[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const HeightWidget(16.0),
                                QuestionWidget(
                                  index: index + 1,
                                  question: question.question,
                                  questionLength:
                                      examController.randomQuestions.length,
                                ),
                                // const HeightWidget(16.0),
                                question.image.isNotEmpty
                                    ? CachedNetworkImage(
                                        imageUrl: question.image,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, val, progress) {
                                          return Image.asset(
                                            "assets/images/placeholder.jpg",
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      )
                                    : const SizedBox(),
                                // const Spacer(),
                                question.image.isNotEmpty
                                    ? const HeightWidget(kDefaultFontSize * 2)
                                    : SizedBox(
                                        height: SizeConfig.screenHeight * 0.1,
                                      ),
                                Column(
                                  children: question.options
                                      .map(
                                        (e) => ExamOptionWidget(
                                          isSelected: question.userAnswer ==
                                              question.options.indexOf(e),
                                          onTap: () {
                                            examController.addUserAnswer(
                                                index, e);
                                          },
                                          option: e,
                                        ),
                                      )
                                      .toList(),
                                )
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const BannerAdwidget(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: Consumer(
                  builder: (context, ref, child) {
                    final examController = ref.watch(examNotifierProvider);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IgnorePointer(
                          ignoring: examController.pageViewIndex == 0,
                          child: GestureDetector(
                            onTap: () {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.decelerate,
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.all(16.0),
                              height: 50.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                color: examController.pageViewIndex == 0
                                    ? kLightGreyColor
                                    : kDrawerColor1,
                              ),
                              child: const Center(
                                child: NormalText(
                                  "Previous",
                                  color: kWhiteColor,
                                  isBold: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                        IgnorePointer(
                          ignoring: examController
                                  .randomQuestions[examController.pageViewIndex]
                                  .userAnswer ==
                              null,
                          child: GestureDetector(
                            onTap: () {
                              if (examController.pageViewIndex ==
                                  examController.randomQuestions.length - 1) {
                                context.router.push(ExamResultScreenRoute(
                                    showResult: !widget.isFromPractice));
                              } else {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.decelerate,
                                );
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.all(16.0),
                              height: 50.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                color: examController
                                            .randomQuestions[
                                                examController.pageViewIndex]
                                            .userAnswer ==
                                        null
                                    ? kLightGreyColor
                                    : kDrawerColor1,
                              ),
                              child: const Center(
                                child: NormalText(
                                  "Next",
                                  color: kWhiteColor,
                                  isBold: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExamOptionWidget extends StatelessWidget {
  const ExamOptionWidget({
    Key? key,
    required this.isSelected,
    required this.option,
    required this.onTap,
  }) : super(key: key);
  final bool isSelected;
  final String option;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              height: 65.0,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: isSelected
                      ? kDrawerColor1
                      : kDrawerColor1.withOpacity(0.1),
                ),
                color:
                    isSelected ? kDrawerColor1 : kDrawerColor1.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: NormalText(
                        option,
                        color: isSelected ? kWhiteColor : kBlackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: kDefaultFontSize,
                      ),
                    ),
                  ),
                  WidthWidget(isSelected ? 8.0 : 16.0),
                  isSelected
                      ? const Icon(
                          Icons.radio_button_checked,
                          color: kWhiteColor,
                        )
                      : const Icon(
                          Icons.radio_button_off,
                          color: kTakeExamSubtitleColor,
                        ),
                ],
              ),
            ),
            const HeightWidget(16.0),
          ],
        ),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.index,
    required this.question,
    required this.questionLength,
  }) : super(key: key);
  final int index;
  final String question;
  final int questionLength;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NormalText(
              question,
              fontSize: kDefaultFontSize + 6,
              color: kBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    Key? key,
    this.title,
    this.boldTitle = false,
    this.onBackPressed,
  }) : super(key: key);
  final String? title;
  final VoidCallback? onBackPressed;
  final bool boldTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onBackPressed ??
              () {
                Navigator.pop(context);
              },
          child: Container(
            padding: const EdgeInsets.all(6.0),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: kBlackColor,
              ),
            ),
          ),
        ),
        title != null
            ? NormalText(
                title!,
                fontWeight: boldTitle ? FontWeight.bold : FontWeight.normal,
              )
            : const SizedBox(),
      ],
    );
  }
}
