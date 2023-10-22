import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/service/shared_pref_provider.dart';
import '../../common/utils/app_size_utils.dart';
import '../../routes/app_router.gr.dart';

class AppSplashScreen extends ConsumerStatefulWidget {
  const AppSplashScreen({
    Key? key,
    this.isSwitched = false,
  }) : super(key: key);
  final bool isSwitched;

  @override
  AppSplashScreenState createState() => AppSplashScreenState();
}

class AppSplashScreenState extends ConsumerState<AppSplashScreen>
    with TickerProviderStateMixin {
  int duration = 1;
  // Completer is used to await for splash animation complete then
  // preform required route change
  final Completer<bool> _completer = Completer();
  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: duration),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    // start animating the splash
    _controller.animateTo(1.0);

    // SharedPref.instance.clear();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // when completed complete the completer
    _animation.addListener(() {
      if (_animation.isCompleted) {
        changeScreen();
        _completer.complete(true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeScreen() {
    final isFirstTime = SharedPrefProvider.instance().getBool("isFirstTime")!;
    if (isFirstTime) {
      AutoRouter.of(context).replace(const WelcomeScreenRoute());
    } else {
      AutoRouter.of(context).replace(NavBarRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: const Color(0xFF557CD0),
        body: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // children: [LottieBuilder.asset("assets/lottie/car.json")],
          ),
        ));
  }
}
