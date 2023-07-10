import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../routes/app_router.gr.dart';

class VnShortnerSplashScreen extends ConsumerStatefulWidget {
  const VnShortnerSplashScreen({
    Key? key,
    this.isSwitched = false,
  }) : super(key: key);
  final bool isSwitched;

  @override
  VnShortnerSplashScreenState createState() => VnShortnerSplashScreenState();
}

class VnShortnerSplashScreenState extends ConsumerState<VnShortnerSplashScreen>
    with TickerProviderStateMixin {
  int duration = 1500;
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
        _completer.complete(true);
        completeSplashScreen();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> completeSplashScreen() async {
    await _completer.future
        .then((value) => AutoRouter.of(context).replace(RootRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: FadeTransition(
          opacity: _animation,
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/applogo.png",
                      height: 200.0,
                      width: 200.0,
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    LoadingAnimationWidget.fourRotatingDots(
                      color: const Color(0xFF4acfd9),
                      size: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
