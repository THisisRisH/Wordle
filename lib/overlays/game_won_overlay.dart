import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';
import '../screens/landing_page.dart';
import 'base_overlay.dart';

class GameWonOverlay extends StatefulWidget {
  const GameWonOverlay({super.key});

  @override
  State<GameWonOverlay> createState() => _GameWonOverlayState();
}

class _GameWonOverlayState extends State<GameWonOverlay> {
  double randomInRange(double min, double max) {
    return min + Random().nextDouble() * (max - min);
  }

  int total = 60;
  int progress = 0;

  void launchConfetti(BuildContext context) {
    Confetti.launch(
      context,
      options: ConfettiOptions(
        particleCount: 100,
        startVelocity: 30,
        spread: ScreenUtil().screenWidth / 4,
        y: 0.5,
      ),
      onFinished: (entry) {},
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      launchConfetti(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.black.withOpacity(0.8),
        ),
        Center(
          child: Center(
            child: Text(
              "You got it!",
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 200.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          top: ScreenUtil().screenHeight / 2 + 400.h,
          child: GestureDetector(
            onTap: () {
              baseOverlay.removeOverlay(Overlays.GameWon);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LandingPage()),
                (Route<dynamic> route) => false,
              );
            },
            child: Container(
              width: 540.w,
              height: 200.h,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20.sp),
              ),
              child: Center(
                child: Text(
                  "Continue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 100.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
