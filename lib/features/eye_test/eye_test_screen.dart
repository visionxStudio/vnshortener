import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:likhitexam/common/constants/constants.dart';
import 'package:likhitexam/common/utils/app_size_utils.dart';
import 'package:likhitexam/common/widgets/text/custom_normal_text_widget.dart';
import 'package:likhitexam/features/eye_test/bloc/eye_test_controller.dart';
import 'package:likhitexam/features/eye_test/models/eye_test_model.dart';

import '../../common/widgets/size/custom_size_widget.dart';

class EyeTestScreen extends ConsumerStatefulWidget {
  const EyeTestScreen({super.key});

  @override
  EyeTestScreenState createState() => EyeTestScreenState();
}

class EyeTestScreenState extends ConsumerState<EyeTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 120,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 100.0),
        child: FloatingActionButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          backgroundColor: const Color(0xFF87b3f7),
          onPressed: () {
            // Show dialog box and show if answer is wrong or correct
            final eyeTestProvider = ref.read(eyeTestProviderNotifier);
            final EyeTestModel currentQuestion =
                eyeTestProvider.questions[eyeTestProvider.currentQuestion];

            // show dialog
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const NormalText(
                    "eye_test.result",
                    isBold: true,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CachedNetworkImage(
                        imageUrl: currentQuestion.image,
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.error);
                        },
                        placeholder: (context, url) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                      const HeightWidget(8.0),
                      NormalText(
                        currentQuestion.userAnswer == currentQuestion.answer
                            ? "eye_test.correct"
                            : "eye_test.wrong",
                        color:
                            currentQuestion.userAnswer == currentQuestion.answer
                                ? Colors.green
                                : Colors.red,
                        isCentered: true,
                        isBold: true,
                      )
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      child: const NormalText(
                        "Ok",
                        color: kPrimaryColor,
                        isBold: true,
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: const Center(
            child: NormalText(
              "eye_test.check",
              color: kWhiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: kBlackColor,
          ),
        ),
        title: Consumer(builder: (context, ref, child) {
          final currentIndex =
              ref.watch(eyeTestProviderNotifier).currentQuestion;
          return NormalText(
            "Color Vision Test (${(currentIndex + 1).toString()} / ${eyeTestDataList.length.toString()})",
            isBold: true,
          );
        }),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight - 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const NormalText(
                "eye_test.what_see",
                isBold: true,
                isUpper: true,
                isCentered: true,
              ),

              // Pageview

              Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.5,
                    child: Consumer(builder: (context, ref, child) {
                      final eyeNotifier = ref.watch(eyeTestProviderNotifier);
                      return PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: eyeNotifier.pageController,
                        itemCount: eyeNotifier.questions.length,
                        itemBuilder: (context, mIndex) {
                          final EyeTestModel eyeData =
                              eyeNotifier.questions[mIndex];
                          return Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl: eyeData.image,
                                errorWidget: (context, url, error) {
                                  return const Icon(Icons.error);
                                },
                                placeholder: (context, url) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              ),
                              // options
                              SizedBox(
                                height: 100.0,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: eyeData.options.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final String data = eyeData.options[index];
                                    return GestureDetector(
                                      onTap: () {
                                        eyeNotifier.selectAnswer(index, mIndex);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(8),
                                        padding: const EdgeInsets.all(2.0),
                                        decoration: eyeData.userAnswer == null
                                            ? null
                                            : eyeData.userAnswer != index
                                                ? null
                                                : BoxDecoration(
                                                    // only show when selected
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xFF87b3f7),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                        child: Container(
                                          padding: const EdgeInsets.all(16.0),
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF87b3f7),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: NormalText(
                                              data,
                                              color: kWhiteColor,
                                              fontSize: kDefaultFontSize + 4,
                                              isBold: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          );
                        },
                      );
                    }),
                  ),
                  const NormalText(
                    "eye_test.tap",
                    color: Colors.grey,
                    fontSize: kDefaultFontSize - 2,
                  ),
                ],
              ),

              // Next Button
              Consumer(builder: (context, ref, child) {
                final eyeTestProvider = ref.watch(eyeTestProviderNotifier);
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 32),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            eyeTestProvider.previousQuestion();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                              color: eyeTestProvider.currentQuestion == 0
                                  ? kPrimaryColor.withOpacity(0.3)
                                  : kPrimaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_left,
                                size: 36.0,
                                color: kWhiteColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (eyeTestProvider.currentQuestion + 1 ==
                                eyeTestProvider.questions.length) {
                              context.router.pop();
                              return;
                            }

                            eyeTestProvider.nextQuestion();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                              color: kPrimaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                eyeTestProvider.currentQuestion + 1 ==
                                        eyeTestProvider.questions.length
                                    ? Icons.exit_to_app
                                    : Icons.arrow_right,
                                size: 36.0,
                                color: kWhiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
