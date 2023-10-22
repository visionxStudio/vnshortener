import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:likhitexam/common/constants/constants.dart';
import 'package:likhitexam/common/utils/app_size_utils.dart';
import 'package:likhitexam/common/widgets/size/custom_size_widget.dart';
import 'package:likhitexam/common/widgets/text/custom_normal_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  void _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        centerTitle: true,
        elevation: 0.0,
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
          'About Us',
          isBold: true,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: SizeConfig.screenHeight - 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // const HeightWidget(16.0),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      height: 160.0,
                      width: 160.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kWhiteColor,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(500.0),
                          child: Image.asset(
                            "assets/images/profile2.jpeg",
                            height: 150.0,
                            width: 150.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const HeightWidget(16.0),
                    const NormalText(
                      "Hello👋, I am Nishan Khatri from Butwal. I am ambitious and is facinated by technology. This app is built with the aim to help people to pass Nepal driving License test (Likhit Exam). ",
                      isCentered: true,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const HeightWidget(kDefaultFontSize * 2),
                    const SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalText(
                            "Find Me On:",
                            fontSize: kDefaultFontSize + 8,
                            isBold: true,
                            hasUnderline: false,
                          ),
                        ],
                      ),
                    ),
                    const HeightWidget(16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialWidget(
                          icon: FlutterRemix.instagram_line,
                          onTap: () {
                            _launchUrl(
                                "https://www.instagram.com/nishankhatri468/");
                          },
                          title: "INSTAGRAM",
                        ),
                        SocialWidget(
                          icon: FlutterRemix.instagram_line,
                          onTap: () {
                            _launchUrl(
                                "https://www.facebook.com/nishankhatri468");
                          },
                          title: "FACEBOOK",
                        ),
                        SocialWidget(
                          icon: FlutterRemix.instagram_line,
                          onTap: () {
                            _launchUrl(
                                "https://twitter.com/Nishankhatri468?t=-WY9aeoZUppUC-zif534_w&s=09");
                          },
                          title: "TWITTER",
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const HeightWidget(16.0),
                const Column(
                  children: [
                    NormalText("If you have any query,"),
                    NormalText(
                      "likhittayari@gmail.com",
                      color: Colors.blue,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialWidget extends StatelessWidget {
  const SocialWidget({
    Key? key,
    required this.onTap,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final VoidCallback onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.screenWidth * 0.8,
        margin: const EdgeInsets.only(bottom: 16.0),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: kGreyColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const WidthWidget(8.0),
            NormalText(title),
          ],
        ),
      ),
    );
  }
}
