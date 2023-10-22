import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:likhitexam/app_localization.dart';
import 'package:likhitexam/common/constants/constants.dart';
import 'package:likhitexam/common/utils/app_size_utils.dart';
import 'package:likhitexam/common/widgets/button/custom_elevated_button.dart';
import 'package:likhitexam/common/widgets/size/custom_size_widget.dart';
import 'package:likhitexam/common/widgets/toast/flutter_toast.dart';
import 'package:likhitexam/features/exam_selection/bloc/exam_selection_controller.dart';
import 'package:likhitexam/features/exam_selection/widgets/exam_preference_widger.dart';
import 'package:likhitexam/routes/app_router.gr.dart';

import '../../common/widgets/text/custom_normal_text_widget.dart';

class ExamSelectionScreen extends StatelessWidget {
  const ExamSelectionScreen({
    Key? key,
    this.isFromNavbar = false,
    this.isFromPracticeExam = false,
    this.isRoadSign = false,
    this.studyQuestions = false,
  }) : super(key: key);
  final bool isFromNavbar;
  final bool isFromPracticeExam;
  final bool isRoadSign;
  final bool studyQuestions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              isFromNavbar
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.all(6.0),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_back,
                                  color: kBlackColor,
                                ),
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: isFromNavbar ? 0.0 : 0.0,
                            child: Icon(
                              Icons.info_outline,
                              color: kTakeExamSubtitleColor.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
              const HeightWidget(32.0),

              Consumer(
                builder: (context, ref, child) {
                  final examController = ref.watch(examNotifierProvider);
                  return SizedBox(
                    height: isFromNavbar
                        ? SizeConfig.screenHeight * 0.7
                        : SizeConfig.screenHeight * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          child: NormalText(
                            "select_exam.preference".tr(context),
                            fontSize: kDefaultFontSize * 1.5,
                            fontWeight: FontWeight.bold,
                            letterspacing: 1.4,
                            color: kBlackColor,
                          ),
                        ),
                        Column(
                          children: [
                            ExamPreferenceWidget(
                              onTap: () {
                                examController.changeSelectedIndex(0);
                              },
                              image: "assets/images/car.png",
                              subtitle: "Cars & Light Trucks",
                              title: "select_exam.car".tr(context),
                              isSelected: examController.selectedIndex == 0,
                            ),
                            const HeightWidget(16.0),
                            ExamPreferenceWidget(
                              onTap: () {
                                examController.changeSelectedIndex(1);
                              },
                              image: "assets/images/bike.png",
                              title: "select_exam.bike".tr(context),
                              subtitle: "Bikes & Scooters",
                              isSelected: examController.selectedIndex == 1,
                              fit: BoxFit.scaleDown,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomElevatedButton(
                            backgroundColor: kDrawerColor1,
                            label: "select_exam.continue".tr(context),
                            onPressed: () {
                              ref
                                  .read(examNotifierProvider)
                                  .initializeData(hardReset: false);
                              if (studyQuestions) {
                                context.router.push(AllQuestionScreenRoute(
                                    isBike: examController.selectedIndex == 0
                                        ? false
                                        : true));
                              } else {
                                if (examController.selectedIndex == -1) {
                                  Fluttertoast.showToast(
                                      msg: 'select_exam.warning'.tr(context));
                                } else {
                                  if (examController.selectedIndex == 0) {
                                    ref
                                        .read(examNotifierProvider)
                                        .generateRandomQuestions(
                                          numberOfQuestions: 15,
                                          isBike: false,
                                          isFromPracticeExam:
                                              isFromPracticeExam,
                                        );
                                  } else {
                                    ref
                                        .read(examNotifierProvider)
                                        .generateRandomQuestions(
                                          numberOfQuestions: 15,
                                          isBike: true,
                                          isFromPracticeExam:
                                              isFromPracticeExam,
                                        );
                                  }

                                  context.router.push(ExamScreenRoute(
                                    isFromPractice: isFromPracticeExam,
                                  ));
                                }
                              }
                            },
                            shouldWorkOnDisabled: true,
                            disabled: examController.selectedIndex == -1,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              // CustomContainer(child: child)
            ],
          ),
        ),
      ),
    );
  }
}
