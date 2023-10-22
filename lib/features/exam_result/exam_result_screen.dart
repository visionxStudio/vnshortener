import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:likhitexam/common/constants/constants.dart';
import 'package:likhitexam/common/widgets/button/custom_elevated_button.dart';
import 'package:likhitexam/common/widgets/size/custom_size_widget.dart';
import 'package:likhitexam/common/widgets/text/custom_normal_text_widget.dart';
import 'package:likhitexam/features/exam_screen/exam_screen.dart';
import 'package:likhitexam/features/exam_selection/bloc/exam_selection_controller.dart';
import 'package:likhitexam/routes/app_router.gr.dart';
import 'package:lottie/lottie.dart';

import '../../common/service/ads_services/rewarded_ads.dart';
import '../exam_screen/model/question_answer_model/question_answer_model.dart';

class ExamResultScreen extends ConsumerStatefulWidget {
  final bool showResult;
  const ExamResultScreen({Key? key, this.showResult = true}) : super(key: key);

  @override
  ExamResultScreenState createState() => ExamResultScreenState();
}

class ExamResultScreenState extends ConsumerState<ExamResultScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      _showResultDialog(context);
    });
    super.initState();
  }

  Future<void> showRewardedAds() async {
    await RewardedAdManager().loadAd();
  }

  _showResultDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        content: ref.read(examNotifierProvider).correctAnswers > 10
            ? SizedBox(
                height: 180.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Lottie.asset(
                      "assets/lottie/success.json",
                      height: 120.0,
                      width: 120.0,
                    ),
                    const NormalText(
                      "Congratulations you have passed the exam",
                      color: kBlackColor,
                      isCentered: true,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              )
            : SizedBox(
                height: 200.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Lottie.asset(
                      "assets/lottie/fail.json",
                      height: 120.0,
                      width: 120.0,
                    ),
                    const NormalText(
                      "Sorry, You have failed the exam, \n However you can try again \n Good luck",
                      color: kBlackColor,
                      isCentered: true,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
        actions: <Widget>[
          TextButton(
              child: const Text(
                'Ok',
                style: TextStyle(fontSize: kDefaultFontSize),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomElevatedButton(
          label: "Continue",
          onPressed: () {
            ref.read(examNotifierProvider).initializeData(
                  hardReset: false,
                );
            context.router.replace(NavBarRoute());
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Consumer(builder: (context, ref, child) {
              final examController = ref.read(examNotifierProvider);
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopAppBar(
                      title: "Result",
                      onBackPressed: () {
                        context.router.replace(NavBarRoute());
                      },
                    ),
                    const HeightWidget(16.0),
                    NormalText(
                      "Correct Answer : ${examController.correctAnswers}/${examController.randomQuestions.length}",
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: kOrangeTextColor,
                    ),
                    const HeightWidget(16.0),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: examController.randomQuestions.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        final QuestionAnswerModel question =
                            examController.randomQuestions[index];

                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 16.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          decoration: BoxDecoration(
                            color: question.isCorrect!
                                ? kCorrectAnswerContainerColor
                                : kWrongAnswerContainerColor,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NormalText(
                                "Question ${index + 1}",
                                color: kQuestionTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: kDefaultFontSize - 2,
                              ),
                              const HeightWidget(8.0),
                              NormalText(
                                question.question,
                                color: kBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: kDefaultFontSize,
                              ),
                              question.image.isNotEmpty
                                  ? Center(
                                      child: CachedNetworkImage(
                                        imageUrl: question.image,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, val, progress) {
                                          return Center(
                                            child: Image.asset(
                                              "assets/images/placeholder.jpg",
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : const SizedBox(),
                              const HeightWidget(8.0),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: question.options.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 16.0,
                                        ),
                                        Row(
                                          children: [
                                            NormalText(
                                              question.options[index],
                                              color: question.userAnswer! ==
                                                      index
                                                  ? question.isCorrect!
                                                      ? kCorrectAnswerTextColor
                                                      : kWrongAnswerTextColor
                                                  : kQuestionTextColor,
                                              fontWeight:
                                                  question.userAnswer! == index
                                                      ? question.isCorrect!
                                                          ? FontWeight.bold
                                                          : FontWeight.bold
                                                      : FontWeight.normal,
                                              fontSize: kDefaultFontSize - 2,
                                              maxline: 2,
                                            ),
                                            const WidthWidget(8.0),
                                            question.userAnswer! == index
                                                ? question.isCorrect!
                                                    ? const Icon(
                                                        Icons.check,
                                                        color:
                                                            kCorrectAnswerTextColor,
                                                      )
                                                    : const Icon(
                                                        Icons.close,
                                                        color:
                                                            kWrongAnswerTextColor,
                                                      )
                                                : const SizedBox(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              const HeightWidget(8.0),
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    NormalText(
                                      "Correct Answer:- ${question.answer}",
                                      fontWeight: FontWeight.bold,
                                      color: kBlackColor,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
