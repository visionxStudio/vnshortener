import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:likhitexam/app_localization.dart';
import 'package:likhitexam/common/animations/show_up_animations.dart';
import 'package:likhitexam/common/constants/constants.dart';
import 'package:likhitexam/common/service/shared_pref_provider.dart';
import 'package:likhitexam/common/utils/app_size_utils.dart';
import 'package:likhitexam/common/widgets/size/custom_size_widget.dart';
import 'package:likhitexam/common/widgets/text/custom_normal_text_widget.dart';
import 'package:likhitexam/features/navbar/navbar.dart';
import 'package:likhitexam/features/welcome_screen/widgets/linear_scaffold_background.dart';
import 'package:likhitexam/routes/app_router.gr.dart';

import '../../locale_provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String _value = "नेपाली";
  final List<Map<String, dynamic>> features = [
    {
      "icon": FlutterRemix.line_chart_line,
      "title": "welcome.f_one",
    },
    {
      "icon": FlutterRemix.clipboard_line,
      "title": "welcome.f_two",
    },
    {
      "icon": FlutterRemix.chat_4_line,
      "title": "welcome.f_three",
    },
    {
      "icon": FlutterRemix.stack_line,
      "title": "welcome.f_three",
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return !SharedPrefProvider.instance().getBool("isFirstTime")!
        ? const NavBar()
        : Scaffold(
            body: Stack(
              children: [
                const LinearScaffoldBackgroundWidget(),
                Positioned(
                  top: SizeConfig.screenHeight * 0.15,
                  child: Image.asset(
                    'assets/images/background_curve.png',
                    height: 183.0,
                  ),
                ),
                Positioned(
                  top: 60.0,
                  right: SizeConfig.screenWidth * 0.0,
                  child: Row(
                    children: [
                      const Icon((FlutterRemix.earth_line),
                          size: 24.0, color: Colors.white),
                      const WidthWidget(16.0),
                      Consumer(
                        builder: (context, ref, child) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: kNavBackgroundColor,
                              value: _value,
                              onChanged: (newValue) {
                                if (newValue == "English") {
                                  SharedPrefProvider.instance()
                                      .setInt("localIndex", 1);
                                  ref.read(localeProvider.notifier).saveLocale(
                                        Locale(
                                          supportedLocale[1],
                                        ),
                                      );
                                  setState(() {
                                    _value = newValue!;
                                  });
                                } else {
                                  SharedPrefProvider.instance()
                                      .setInt("localIndex", 0);
                                  ref.read(localeProvider.notifier).saveLocale(
                                        Locale(
                                          supportedLocale[0],
                                        ),
                                      );
                                  setState(() {
                                    _value = newValue!;
                                  });
                                }
                              },
                              items: <String>[
                                'English',
                                "नेपाली"
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: NormalText(
                                    value,
                                    color: kWhiteColor,
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -130.0,
                  left: -150.0,
                  child: Image.asset(
                    'assets/images/top_circle.png',
                  ),
                ),
                ShowUpTransition(
                  duration: const Duration(milliseconds: 3000),
                  forward: true,
                  slideSide: SlideFromSlide.RIGHT,
                  child: SizedBox(
                    height: SizeConfig.screenHeight * 0.49,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/images/car.png',
                        height: 280.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: SizeConfig.screenHeight * 0.43,
                  child: SizedBox(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * (1 - 0.48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShowUpTransition(
                          duration: const Duration(milliseconds: 1500),
                          forward: true,
                          slideSide: SlideFromSlide.LEFT,
                          // delay: Duration(milliseconds: 300),
                          child: NormalText(
                            "welcome.maximize".tr(context),
                            color: kWhiteColor,
                            isCentered: true,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // const HeightWidget(16.0),
                        const Spacer(),

                        ShowUpTransition(
                          duration: const Duration(milliseconds: 1500),
                          forward: true,
                          slideSide: SlideFromSlide.RIGHT,
                          child: Container(
                            height: 40.0,
                            width: SizeConfig.screenWidth * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              gradient: LinearGradient(
                                colors: [
                                  buttonLinearGradientleft,
                                  buttonLinearGradientRight,
                                ],
                              ),
                            ),
                            child: const Center(
                              child: NormalText(
                                "Driving License Exam",
                                color: kWhiteColor,
                                fontSize: kDefaultFontSize - 2,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const HeightWidget(32.0),
                        ShowUpTransition(
                          duration: const Duration(milliseconds: 1500),
                          forward: true,
                          slideSide: SlideFromSlide.RIGHT,
                          child: NormalText(
                            "welcome.no_1".tr(context),
                            color: kWhiteColor,
                            isCentered: true,
                            fontSize: kDefaultFontSize - 4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const HeightWidget(32.0),
                        // const Spacer(),

                        ShowUpTransition(
                          duration: const Duration(milliseconds: 1500),
                          forward: true,
                          slideSide: SlideFromSlide.RIGHT,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: SizedBox(
                              width: SizeConfig.screenWidth,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: features
                                    .map(
                                      (e) => Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 45.0,
                                            width: 45.0,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFF3B31C2),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                e['icon'],
                                                color: kWhiteColor,
                                              ),
                                            ),
                                          ),
                                          const HeightWidget(8.0),
                                          NormalText(
                                            e['title'].toString().tr(context),
                                            isCentered: true,
                                            color: const Color(0xff9890FF),
                                            fontWeight: FontWeight.normal,
                                            fontSize: kDefaultFontSize - 6,
                                            maxline: 2,
                                          ),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Spacer(),

                        ShowUpTransition(
                          duration: const Duration(milliseconds: 1500),
                          forward: true,
                          slideSide: SlideFromSlide.BOTTOM,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.router.replace(NavBarRoute());
                                  SharedPrefProvider.instance()
                                      .setBool("isFirstTime", false);
                                },
                                child: Container(
                                  height: 55.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    gradient: LinearGradient(
                                      colors: [
                                        buttonLinearGradientleft,
                                        buttonLinearGradientRight,
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: NormalText(
                                      "welcome.continue".tr(context),
                                      fontSize: kDefaultFontSize + 2,
                                      fontWeight: FontWeight.w500,
                                      color: kWhiteColor,
                                    ),
                                  ),
                                ),
                              ),
                              const HeightWidget(16.0),
                              SizedBox(
                                width: SizeConfig.screenWidth,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    NormalText(
                                      "Read our ",
                                      color: kWhiteColor,
                                      fontSize: kDefaultFontSize - 4,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    NormalText(
                                      "Terms and Conditions.",
                                      color: kWhiteColor,
                                      fontSize: kDefaultFontSize - 4,
                                      fontWeight: FontWeight.bold,
                                      hasUnderline: true,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
