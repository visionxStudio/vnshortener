import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdManager {
  RewardedAd? _rewardedAd;
  bool _isShowingAd = false;
  static bool isLoaded = false;
  bool watched = false;

  /// Load an AppOpenAd.
  Future<bool> loadAd() async {
    await RewardedAd.load(
      adUnitId: "ca-app-pub-5250942490664275/3768625163",
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          // debugPrint("Ad Loadede.................................");
          _rewardedAd = ad;
          isLoaded = true;
          _rewardedAd!.show(
            onUserEarnedReward: (ad, reward) => watched = true,
          );
        },
        onAdFailedToLoad: (error) {
          watched = true;

          log(error.toString());
          // Handle the error.
        },
      ),
    ).whenComplete(() {
      debugPrint("Ad Loadede.................................");
    });
    return watched;
  }

  // Whether an ad is available to be shown.
  bool get isAdAvailable {
    return _rewardedAd != null;
  }

  void showAdIfAvailable() {
    debugPrint(
        "Called=====================================================================");
    if (_rewardedAd == null) {
      debugPrint('Tried to show ad before available.');
      loadAd();
      return;
    }
    if (_isShowingAd) {
      debugPrint('Tried to show ad while already showing an ad.');
      return;
    }
    // Set the fullScreenContentCallback and show the ad.
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
        debugPrint('$ad onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
        _isShowingAd = false;
        ad.dispose();
        _rewardedAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        debugPrint('$ad onAdDismissedFullScreenContent');
        _isShowingAd = false;
        ad.dispose();
        _rewardedAd = null;
        loadAd();
      },
    );
    _rewardedAd!.show(
      onUserEarnedReward: (ad, reward) => debugPrint(reward.toString()),
    );
  }
}
