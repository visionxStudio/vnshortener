import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:likhitexam/app_localization.dart';
import 'package:likhitexam/common/common_service_provider.dart';
import 'package:likhitexam/common/constants/constants.dart';
import 'package:likhitexam/common/service/ads_services/banner_ads.dart';
import 'package:likhitexam/common/utils/app_size_utils.dart';
import 'package:likhitexam/common/widgets/size/custom_size_widget.dart';
import 'package:likhitexam/common/widgets/text/custom_normal_text_widget.dart';

import 'package:likhitexam/features/home_screen/widgets/home_card_widgets.dart';
import 'package:likhitexam/features/home_screen/widgets/take_exam_widget.dart';
import 'package:likhitexam/routes/app_router.gr.dart';
import 'package:likhitexam/routes/router.dart';

import '../../common/widgets/input_field/minimal_input_field.dart';
import '../../common/widgets/toast/flutter_toast.dart';
import '../exam_selection/bloc/all_question_controller.dart';
import '../exam_selection/bloc/exam_selection_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: kWhiteColor,
        statusBarBrightness: Brightness.light,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: WelcomeWidget(),
            ),
            const HeightWidget(16.0),
            const TakeTestWidget(),
            const HeightWidget(16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 16.0, bottom: 0.0),
                  child: NormalText(
                    "Your ToolBox",
                    fontWeight: FontWeight.bold,
                    fontSize: kDefaultFontSize,
                  ),
                ),
                HomeCardFeatures(),
              ],
            ),
            const BannerAdwidget(),
            const TakeExamWidget(),
            const HeightWidget(100.0),
          ],
        ),
      ),
    );
  }
}

class TakeTestWidget extends StatelessWidget {
  const TakeTestWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      height: SizeConfig.screenHeight * 0.22,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF87b3f7),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                width: SizeConfig.screenWidth * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    NormalText(
                      "homepage.ready",
                      color: kWhiteColor,
                      isBold: true,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    NormalText(
                      "homepage.mock_test",
                      color: kWhiteColor,
                      fontSize: kDefaultFontSize - 3,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.router.push(ExamSelectionScreenRoute());
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  width: SizeConfig.screenWidth * 0.3,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                      color: kWhiteColor),
                  child: const Center(
                    child: NormalText(
                      "homepage.try",
                      isBold: true,
                      color: Color(0xFF2475f5),
                      fontSize: kDefaultFontSize - 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0.0,
            bottom: -30.0,
            child: Image.asset(
              "assets/images/take_test.png",
              height: SizeConfig.screenHeight * 0.2,
              width: SizeConfig.screenWidth * 0.4,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCardFeatures extends StatelessWidget {
  const HomeCardFeatures({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Consumer(builder: (context, ref, child) {
                return HomeCardWidget(
                  onTap: () {
                    context.router.push(const RoadSignScreenRoute());
                  },
                  color: const Color(0xFFE8F6FF),
                  icon: "assets/images/warning.png",
                  title: "homepage.road",
                );
              }),
              Consumer(
                builder: (context, ref, child) {
                  return HomeCardWidget(
                    onTap: () {
                      ref.refresh(examNotifierProvider);

                      context.router.push(
                          ExamSelectionScreenRoute(isFromPracticeExam: true));
                    },
                    color: const Color(0xFFFFEEF2),
                    icon: "assets/images/practice.png",
                    title: "homepage.practice",
                  );
                },
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  return HomeCardWidget(
                    onTap: () {
                      ref.refresh(examNotifierProvider);
                      context.router.push(ExamSelectionScreenRoute());
                    },
                    color: const Color(0xFFF5F5FE),
                    icon: "assets/images/qa.png",
                    title: "homepage.take",
                  );
                },
              ),
              Consumer(
                builder: (context, ref, child) {
                  return HomeCardWidget(
                    onTap: () {
                      ref.refresh(allQuestionNotifierProvider);
                      context.router
                          .push(ExamSelectionScreenRoute(studyQuestions: true));
                    },
                    color: const Color(0xFFFEF3E5),
                    icon: "assets/images/book.png",
                    title: "homepage.study",
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WelcomeWidget extends ConsumerStatefulWidget {
  const WelcomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  WelcomeWidgetState createState() => WelcomeWidgetState();
}

class WelcomeWidgetState extends ConsumerState<WelcomeWidget> {
  Future<void> changeNameDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          title: const Text('Change Your Name'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Enter your name:'),
                const HeightWidget(16.0),
                MinimalInputField(
                  hintText: "e.g. John Smith",
                  backgroundColor: kGreyColor.withOpacity(0.1),
                  onChanged: ref.read(commonServiceProvider).nameChanged,
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: kGreyColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                if (ref.read(commonServiceProvider).tempName != null) {
                  if (ref.read(commonServiceProvider).tempName!.isNotEmpty) {
                    ref
                        .read(commonServiceProvider)
                        .setUserName(ref.read(commonServiceProvider).tempName!);
                    Fluttertoast.showToast(
                      msg: "Name Changed",
                      toastLength: Toast.lengthShort,
                    );
                    Navigator.of(context).pop();
                  } else {
                    Fluttertoast.showToast(
                      msg: "Empty Name!",
                      toastLength: Toast.lengthShort,
                    );
                  }
                } else {
                  Fluttertoast.showToast(
                    msg: "Please enter your name!",
                    toastLength: Toast.lengthShort,
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NormalText(
              "${"homepage.welcome".tr(context)} 👋",
              color: kGreyColor,
              fontSize: kDefaultFontSize,
            ),
            Consumer(
              builder: (context, ref, child) {
                final commonService = ref.watch(commonServiceProvider);
                return Row(
                  children: [
                    NormalText(
                      commonService.userName,
                      color: kPrimaryTextColor,
                      letterspacing: 1.4,
                      fontSize: kDefaultFontSize + 6,
                      fontWeight: FontWeight.bold,
                    ),
                    const WidthWidget(6.0),
                    GestureDetector(
                      onTap: () {
                        changeNameDialog();
                      },
                      child: const Icon(
                        Icons.edit,
                        color: Colors.grey,
                        size: 20,
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ],
    );
  }
}
