import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:likhitexam/common/constants/constants.dart';
import 'package:likhitexam/common/utils/app_size_utils.dart';
import 'package:likhitexam/common/widgets/text/custom_normal_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/widgets/size/custom_size_widget.dart';
import '../exam_screen/model/question_answer_model/question_answer_model.dart';
import '../exam_selection/bloc/all_question_controller.dart';

List<String> options = ["क", "ख", "ग", "घ"];

class AllQuestionScreen extends ConsumerStatefulWidget {
  final bool isBike;
  const AllQuestionScreen({Key? key, required this.isBike}) : super(key: key);

  @override
  AllQuestionScreenState createState() => AllQuestionScreenState();
}

class AllQuestionScreenState extends ConsumerState<AllQuestionScreen> {
  ScrollController homepageScrollController = ScrollController();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      ref.read(allQuestionNotifierProvider).generateQuestions(
            isBike: widget.isBike,
          );
    });

    super.initState();
    homepageScrollController.addListener(() {
      if (homepageScrollController.position.maxScrollExtent ==
          homepageScrollController.offset) {
        //  Load more data in here
        ref
            .read(allQuestionNotifierProvider)
            .generateQuestions(isBike: true, isLoadingMore: true);
      }
      // _scrollControllerArrowUpController(
      //     homepageScrollController.position.pixels);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kUnselectedCardColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kBlackColor,
          ),
          onPressed: () {
            context.router.pop();
          },
        ),
        title: const NormalText(
          'All Questions',
          isBold: true,
        ),
        backgroundColor: kWhiteColor,
        elevation: 0.0,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          controller: homepageScrollController,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        final examController =
                            ref.watch(allQuestionNotifierProvider);
                        return examController.isLoading
                            ? const SizedBox()
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    examController.randomQuestions.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  final QuestionAnswerModel question =
                                      examController.randomQuestions[index];

                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 16.0),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 16.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: kWhiteColor,
                                      borderRadius: BorderRadius.circular(16.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: kBlackColor.withOpacity(0.1),
                                          blurRadius: 4.0,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ReportWidget(
                                          question: question.question,
                                        ),
                                        const HeightWidget(8.0),

                                        NormalText(
                                          question.question,
                                          isBold: true,
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
                                        // options

                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: question.options.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            final bool isSelected = options
                                                    .indexOf(question.answer) ==
                                                index;
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 4.0),
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 8.0),
                                                width: SizeConfig.screenWidth *
                                                    0.8,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 16.0,
                                                  vertical: 8.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 2,
                                                    color: isSelected
                                                        ? kDrawerColor1
                                                        : kDrawerColor1
                                                            .withOpacity(0.1),
                                                  ),
                                                  color: isSelected
                                                      ? kDrawerColor1
                                                      : kDrawerColor1
                                                          .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: SizedBox(
                                                        child: NormalText(
                                                          question
                                                              .options[index]
                                                              .toString(),
                                                          color: isSelected
                                                              ? kWhiteColor
                                                              : kBlackColor,
                                                          fontSize:
                                                              kDefaultFontSize,
                                                        ),
                                                      ),
                                                    ),
                                                    WidthWidget(
                                                      isSelected ? 8.0 : 16.0,
                                                    ),
                                                    isSelected
                                                        ? const Icon(
                                                            Icons.check_circle,
                                                            color: kWhiteColor,
                                                          )
                                                        : const SizedBox()
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  );

                                  // return Container(
                                  //   width: double.infinity,
                                  //   margin: const EdgeInsets.only(bottom: 16.0),
                                  //   padding: const EdgeInsets.symmetric(
                                  //       horizontal: 16.0, vertical: 16.0),
                                  //   decoration: BoxDecoration(
                                  //     // color: Colors.grey.withOpacity(0.3),
                                  //     color: kscaffoldcolor2,
                                  //     borderRadius: BorderRadius.circular(16.0),
                                  //   ),
                                  //   child: Column(
                                  //     crossAxisAlignment:
                                  //         CrossAxisAlignment.start,
                                  //     children: [
                                  //       const HeightWidget(8.0),
                                  //       NormalText(
                                  //         question.question,
                                  //         color: kBlackColor,
                                  //         fontWeight: FontWeight.bold,
                                  //         fontSize: kDefaultFontSize,
                                  //       ),
                                  //       question.image.isNotEmpty
                                  //           ? Center(
                                  //               child: CachedNetworkImage(
                                  //                 imageUrl: question.image,
                                  //                 height: 50.0,
                                  //                 fit: BoxFit.cover,
                                  //                 progressIndicatorBuilder:
                                  //                     (context, val, progress) {
                                  //                   return Center(
                                  //                     child: Image.asset(
                                  //                       "assets/images/placeholder.jpg",
                                  //                       height: 50.0,
                                  //                       fit: BoxFit.cover,
                                  //                     ),
                                  //                   );
                                  //                 },
                                  //               ),
                                  //             )
                                  //           : const SizedBox(),
                                  //       const HeightWidget(8.0),
                                  //       ListView.builder(
                                  //         shrinkWrap: true,
                                  //         itemCount: question.options.length,
                                  //         physics:
                                  //             const NeverScrollableScrollPhysics(),
                                  //         itemBuilder: (context, index) {
                                  //           return Padding(
                                  //             padding: const EdgeInsets.only(
                                  //                 bottom: 4.0),
                                  //             child: Row(
                                  //               children: [
                                  //                 const SizedBox(
                                  //                   width: 16.0,
                                  //                 ),
                                  //                 Row(
                                  //                   children: [
                                  //                     NormalText(
                                  //                       question.options[index],
                                  //                       color: options.indexOf(
                                  //                                   question
                                  //                                       .answer) ==
                                  //                               index
                                  //                           ? Colors.green
                                  //                           : kQuestionTextColor,
                                  //                       fontWeight: options.indexOf(
                                  //                                   question
                                  //                                       .answer) ==
                                  //                               index
                                  //                           ? FontWeight.bold
                                  //                           : FontWeight.normal,
                                  //                       fontSize:
                                  //                           kDefaultFontSize -
                                  //                               2,
                                  //                       maxline: 2,
                                  //                     ),
                                  //                     options.indexOf(question
                                  //                                 .answer) ==
                                  //                             index
                                  //                         ? const Icon(
                                  //                             Icons.check,
                                  //                             color:
                                  //                                 Colors.green,
                                  //                           )
                                  //                         : const SizedBox(),
                                  //                   ],
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           );
                                  //         },
                                  //       ),
                                  //       const HeightWidget(8.0),
                                  //       SizedBox(
                                  //         width: double.infinity,
                                  //         child: Column(
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.end,
                                  //           children: [
                                  //             NormalText(
                                  //               "Correct Answer:- ${question.answer}",
                                  //               fontWeight: FontWeight.bold,
                                  //               color: kBlackColor,
                                  //             )
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // );
                                },
                              );
                      },
                    ),
                    ref.watch(allQuestionNotifierProvider).isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportWidget extends StatefulWidget {
  const ReportWidget({Key? key, required this.question}) : super(key: key);

  final String question;

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      // Show SnackBar
      showErrorDialog();
    }
  }

  void showErrorDialog() {
    // Show dialog box
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          title: const NormalText("Error"),
          content: const NormalText("Mail app not found"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const NormalText(
                "Ok",
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final Uri params = Uri(
          scheme: 'mailto',
          path: 'likhittayari@gmail.com',
          query:
              'subject=Question Report&body= Can you check question number : ${widget.question} ', //add subject and body here
        );
        var url = params.toString();
        _launchUrl(url);
      },
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          NormalText(
            "Report Question",
            color: kBlackColor,
            fontSize: kDefaultFontSize - 2,
          ),
          WidthWidget(8.0),
          Icon(
            Icons.report,
            color: kDrawerColor1,
          ),
        ],
      ),
    );
  }
}
