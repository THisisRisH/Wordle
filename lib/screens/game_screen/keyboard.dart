import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/puzzle_animation_controller.dart';
import '../../model/keyboard_key.dart';

class Keyboard extends StatefulWidget {
  PuzzleAnimationController puzzleAnimationController;
  Keyboard(this.puzzleAnimationController, {super.key});

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  List<List<String>> keys = [
    ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
    ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
    ["Z", "X", "C", "V", "B", "N", "M"]
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        getFirstRow(),
        getSecondRow(),
        getThirdRow(),
      ],
    );
  }

  Widget getFirstRow() {
    List<Widget> children = [];
    for (int i = 0; i < keys[0].length; i++) {
      KeyboardKey key =
          widget.puzzleAnimationController.keys[keys[0][i].codeUnitAt(0) - 65];
      key.keyChar = keys[0][i];
      children.add(
        GestureDetector(
          onTap: () {
            widget.puzzleAnimationController.keyPress(keys[0][i]);
          },
          child: ValueListenableBuilder(
              valueListenable: widget.puzzleAnimationController.gridNotifiers
                  .keyboardNotifiers[keys[0][i].codeUnitAt(0) - 65],
              builder: (context, _, child) {
                return Container(
                  margin: EdgeInsets.all(10.w),
                  width: 120.w,
                  height: 150.h,
                  decoration: BoxDecoration(
                    color: key.keyColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Text(
                      key.keyChar,
                      style: TextStyle(
                        fontSize: 85.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  Widget getSecondRow() {
    List<Widget> children = [];
    for (int i = 0; i < keys[1].length; i++) {
      KeyboardKey key =
          widget.puzzleAnimationController.keys[keys[1][i].codeUnitAt(0) - 65];
      key.keyChar = keys[1][i];
      children.add(
        GestureDetector(
          onTap: () {
            widget.puzzleAnimationController.keyPress(keys[1][i]);
          },
          child: ValueListenableBuilder(
              valueListenable: widget.puzzleAnimationController.gridNotifiers
                  .keyboardNotifiers[keys[1][i].codeUnitAt(0) - 65],
              builder: (context, _, child) {
                return Container(
                  margin: EdgeInsets.all(10.w),
                  width: 120.w,
                  height: 150.h,
                  decoration: BoxDecoration(
                    color: key.keyColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Text(
                      key.keyChar,
                      style: TextStyle(
                        fontSize: 85.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  Widget getThirdRow() {
    List<Widget> children = [];
    for (int i = 0; i < keys[2].length; i++) {
      KeyboardKey key =
          widget.puzzleAnimationController.keys[keys[2][i].codeUnitAt(0) - 65];
      key.keyChar = keys[2][i];
      children.add(
        GestureDetector(
          onTap: () {
            widget.puzzleAnimationController.keyPress(keys[2][i]);
          },
          child: ValueListenableBuilder(
              valueListenable: widget.puzzleAnimationController.gridNotifiers
                  .keyboardNotifiers[keys[2][i].codeUnitAt(0) - 65],
              builder: (context, _, child) {
                return Container(
                  margin: EdgeInsets.all(10.w),
                  width: 120.w,
                  height: 150.h,
                  decoration: BoxDecoration(
                    color: key.keyColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Text(
                      key.keyChar,
                      style: TextStyle(
                        fontSize: 85.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
        ),
      );
    }
    KeyboardKey key = KeyboardKey("-");
    Widget backSpace = GestureDetector(
      onTap: () => widget.puzzleAnimationController.backSpacekeyPress("-"),
      child: ValueListenableBuilder(
          valueListenable: widget
              .puzzleAnimationController.gridNotifiers.keyboardNotifiers[26],
          builder: (context, _, child) {
            return Container(
              margin: EdgeInsets.all(10.w),
              width: 160.w,
              height: 150.h,
              decoration: BoxDecoration(
                color: key.keyColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: Text(
                  key.keyChar,
                  style: TextStyle(
                    fontSize: 85.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }),
    );
    children.add(backSpace);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }
}
