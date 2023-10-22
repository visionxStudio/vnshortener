import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdwidget extends StatefulWidget {
  const BannerAdwidget({Key? key}) : super(key: key);

  @override
  BannerAdwidgetState createState() => BannerAdwidgetState();
}

class BannerAdwidgetState extends State<BannerAdwidget> {
  @override
  void initState() {
    super.initState();
    myBanner.load();
  }

  final BannerAd myBanner = BannerAd(
    // adUnitId: 'ca-app-pub-3940256099942544/6300978111',
    adUnitId: 'ca-app-pub-5250942490664275/5839586559',

    size: AdSize.banner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: AdWidget(ad: myBanner),
    );
  }
}
