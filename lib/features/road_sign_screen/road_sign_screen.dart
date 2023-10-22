import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:likhitexam/common/constants/constants.dart';
import 'package:likhitexam/common/widgets/size/custom_size_widget.dart';
import 'package:likhitexam/common/widgets/text/custom_normal_text_widget.dart';
import 'package:likhitexam/features/exam_screen/model/road_sign_questions_model/road_sign_question_model.dart';
import 'package:likhitexam/features/exam_selection/bloc/exam_selection_controller.dart';
import 'package:likhitexam/features/road_sign_screen/traffic_light_model.dart';

import '../../common/service/ads_services/banner_ads.dart';

class RoadSignScreen extends ConsumerStatefulWidget {
  const RoadSignScreen({Key? key}) : super(key: key);

  @override
  RoadSignScreenState createState() => RoadSignScreenState();
}

class RoadSignScreenState extends ConsumerState<RoadSignScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1), () {
      ref.read(examNotifierProvider).generateRoadSignQuestions();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: const NormalText("Road & traffic Signs", isBold: true),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kBlackColor,
          ),
        ),
        elevation: 0.0,
      ),
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NormalText("Traffic Signs", isBold: true),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemExtent: 100.0,
                  itemCount: trafficLights.length,
                  itemBuilder: (BuildContext context, int index) {
                    final TrafficLightModel question = trafficLights[index];

                    return GestureDetector(
                      onTap: () {
                        // Open dialog box to show image
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: CachedNetworkImage(
                                imageUrl: question.image,
                                height: 300.0,
                                width: 300.0,
                                errorWidget: (context, url, error) {
                                  return const Icon(Icons.error);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xfff7f7f7),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: question.image,
                              height: 60.0,
                              width: 60.0,
                              errorWidget: (context, url, error) {
                                return const Icon(Icons.error);
                              },
                            ),
                            const WidthWidget(16.0),
                            Expanded(
                              child: NormalText(
                                question.description.split(')').last,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const BannerAdwidget(),

                // const HeightWidget(8.0),
                Consumer(
                  builder: (context, ref, child) {
                    final trafficController = ref.watch(examNotifierProvider);
                    return trafficController.isLoading
                        ? const SizedBox()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HeightWidget(8.0),
                              const NormalText("Road Signs", isBold: true),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemExtent: 100.0,
                                itemCount: trafficController
                                    .roadSignQuestionList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final RoadSignQuestionModel question =
                                      trafficController
                                          .roadSignQuestionList[index];

                                  return GestureDetector(
                                    onTap: () {
                                      // Open dialog box to show image
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            child: CachedNetworkImage(
                                              imageUrl: question.imageUrl,
                                              height: 300.0,
                                              width: 300.0,
                                              errorWidget:
                                                  (context, url, error) {
                                                return const Icon(Icons.error);
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      margin:
                                          const EdgeInsets.only(bottom: 16.0),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 8.0),
                                      decoration: BoxDecoration(
                                        color: const Color(0xfff7f7f7),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: const Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: question.imageUrl,
                                            height: 60.0,
                                            width: 60.0,
                                            errorWidget: (context, url, error) {
                                              return const Icon(Icons.error);
                                            },
                                          ),
                                          const WidthWidget(16.0),
                                          Expanded(
                                            child: NormalText(
                                              question.answer.split(')').last,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
