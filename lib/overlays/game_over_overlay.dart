import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';
import '../screens/landing_page.dart';
import 'base_overlay.dart';

class GameOverOverlay extends StatefulWidget {
  String answerWord = "";
  GameOverOverlay(this.answerWord, {super.key});

  @override
  State<GameOverOverlay> createState() => _GameOverOverlayState();
}

class _GameOverOverlayState extends State<GameOverOverlay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.black.withOpacity(0.8),
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
        ),
        Container(),
        Positioned(
          top: 1000.h,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.all(16.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Correct Answer: ${widget.answerWord}",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 100.sp, // Reduced from 100.sp
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          child: Text(
            "Game Over",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 200.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: ScreenUtil().screenHeight / 2 + 400.h,
          child: GestureDetector(
            onTap: () {
              baseOverlay.removeOverlay(Overlays.GameOver);
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
