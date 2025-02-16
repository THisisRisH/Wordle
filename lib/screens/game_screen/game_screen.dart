import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/puzzle_animation_controller.dart';
import 'grid.dart';
import 'keyboard.dart';

class GameScreen extends StatefulWidget {
  int puzzleDimmension = 5;
  GameScreen(this.puzzleDimmension, {super.key});
  static const String routeName = "/GameScreen";

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late PuzzleAnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = PuzzleAnimationController(widget.puzzleDimmension);
    animationController.init();
    // Set full screen mode when widget initializes
  }

  @override
  void dispose() {
    // Restore system UI when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              color: const Color.fromARGB(255, 101, 34, 113),
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
            ),
            Positioned(
              top: ScreenUtil().statusBarHeight + 120.h,
              child: Grid(widget.puzzleDimmension, animationController),
            ),
            Positioned(
              top: 2100.h,
              child: submitButton(),
            ),
            Positioned(
              top: 2400.h,
              child: Keyboard(animationController),
            )
          ],
        ));
  }

  Widget submitButton() {
    return GestureDetector(
      onTap: () => animationController.submitWord(context),
      child: Container(
        width: 400.w,
        height: 200.h,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "Submit",
              style: TextStyle(
                fontSize: 90.sp,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
