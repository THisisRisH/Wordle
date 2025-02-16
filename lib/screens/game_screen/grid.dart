import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/puzzle_animation_controller.dart';
import '../../model/tile.dart';

class Grid extends StatefulWidget {
  int gridDimension = 5;
  PuzzleAnimationController puzzleAnimationController;
  Grid(this.gridDimension, this.puzzleAnimationController, {super.key});

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1400.w,
      height: 1400.h,
      // margin: EdgeInsets.symmetric(horizontal: 0.w),
      //color: Colors.black,
      child: GridArea(), // Directly call getRow
    );
  }

  Widget GridArea() {
    List<Widget> children = [];
    for (int i = 0; i < widget.gridDimension; i++) {
      children.add(getRow(i));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  Widget getRow(int index) {
    List<Widget> chilrens = [];
    for (int i = 0; i < widget.gridDimension; i++) {
      Tile tile = widget.puzzleAnimationController
          .gridTiles[index * widget.gridDimension + i];
      chilrens.add(
        ValueListenableBuilder(
          valueListenable: widget.puzzleAnimationController.gridNotifiers
              .gridNotifiers[index * widget.gridDimension + i],
          builder: (context, _, child) {
            return Container(
              width: 200.w, // Responsive width
              height: 200.h, // Responsive height
              decoration: BoxDecoration(
                color: tile.color,
                borderRadius: BorderRadius.circular(20.sp),
              ),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    tile.text,
                    style: TextStyle(
                        fontSize: 100.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: chilrens);
  }
}
