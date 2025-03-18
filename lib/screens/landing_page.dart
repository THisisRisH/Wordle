import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wordle/services/analytics.dart';

import 'game_screen/game_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  static const String routeName = "/LandingPage";

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    Analytics.logException(
        AssertionError("testing non fatal"), StackTrace.current);
    super.initState();
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
          children: [
            Container(color: Colors.black.withOpacity(0.9)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => GameScreen(5)),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Container(
                    width: 1100.w,
                    height: 250.h,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(147, 44, 167, 48),
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    child: Center(
                      child: Text(
                        "CLASSIC - 5 Letters",
                        style: TextStyle(fontSize: 90.sp, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => GameScreen(4)),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Container(
                    width: 1000.w,
                    height: 250.h,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(239, 214, 138, 39),
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    child: Center(
                        child: Text(
                      "QUARDLE - 4 LETTERS",
                      style: TextStyle(
                        fontSize: 90.sp,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
                SizedBox(height: 100.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => GameScreen(6)),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Container(
                    width: 1000.w,
                    height: 250.h,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(239, 214, 138, 39),
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    child: Center(
                        child: Text(
                      "SIXLE - 6 Letters",
                      style: TextStyle(fontSize: 90.sp, color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
