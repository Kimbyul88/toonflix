import 'dart:async';

import 'package:flutter/material.dart';

//App 클래스는 앱 실행의 첫 루트라고 생각하면 된다.
class Pomodor extends StatefulWidget {
  const Pomodor({super.key});

  @override
  State<Pomodor> createState() => _PomodorState();
}

class _PomodorState extends State<Pomodor> {
  int totalRest = 5;
  int roundFull = 2;
  late int goalFull = 2 * roundFull;
  bool roundOne = false;
  bool isResting = false;
  int round = 0, goal = 0;
  bool isPlaying = false;
  late num min;
  late num sec;
  late int selectedSec = 0;
  late int totalSec = 0;
  Timer timer = Timer(const Duration(), () {});
  Timer timer2 = Timer(const Duration(), () {});

  void handleStopWatch() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (goal == goalFull) {
          isPlaying = false;
          timer.cancel();
          totalSec = selectedSec;
          round = 0;
          goal = 0;
          return;
        } else if (totalSec == 0) {
          if (goal % 2 == 1 && goal != 0) {
            round++;
            isPlaying = false;
            timer.cancel();
            setState(() {
              handleRest();
            });
            totalRest = 5;
          } else {
            goal++;
            totalSec = selectedSec;
            roundOne = !roundOne;
          }
        } else {
          isPlaying = true;
          totalSec = totalSec - 1;
        }
      });
    });
  }

  void handlePause() {
    isPlaying = false;
    timer.cancel();
    setState(() {});
  }

  void handleSkip() {
    timer.cancel();
    setState(() {
      isPlaying = false;
      totalSec = selectedSec;
      goal = 0;
      round = 0;
    });
  }

  void handleSelect(int max) {
    print(max);
    setState(() {
      selectedSec = max;
      totalSec = selectedSec;
      round = 0;
      goal = 0;
    });
  }

  void handleRest() {
    isResting = true;
    timer2 = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (totalRest == 0) {
        return;
      }
      totalRest--;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  //모든 위젯에는 build 메소드를 포함해야 한다.
  Widget build(BuildContext context) {
    Color redColor = const Color.fromRGBO(226, 88, 95, 1);
    Color yellowColor = const Color.fromRGBO(241, 233, 211, 1);
    Color navyColor = const Color.fromRGBO(30, 35, 68, 1);
    Color bgColor = isResting ? navyColor : redColor;
    return MaterialApp(
      //BuildContext 클래스는 다 같은 테마데이터를 공유하고 따라서 그걸 다른 클래스에서도 사용가능!
      theme: ThemeData(
          textTheme: TextTheme(
        titleSmall: TextStyle(
          color: bgColor,
          fontSize: 200,
          fontWeight: FontWeight.w600,
        ),
      )),
      home: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Transform.rotate(
                        angle: 3.14 / 2.0,
                        child: Icon(
                          color: yellowColor,
                          Icons.bar_chart_sharp,
                        ),
                      ),
                      TextButton(
                          onPressed: handleSkip,
                          child: Text(
                            "RESET",
                            style: TextStyle(
                              color: yellowColor,
                              fontSize: 20,
                            ),
                          )),
                    ],
                  ),
                  Text(
                    format(totalSec),
                    style: TextStyle(
                      color: yellowColor,
                      fontSize: 120,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  isResting
                      ? Text(
                          format(totalRest),
                          style: TextStyle(
                              color: yellowColor,
                              fontSize: 50,
                              fontWeight: FontWeight.w600),
                        )
                      : Text(
                          "",
                          style: TextStyle(
                              color: yellowColor,
                              fontSize: 50,
                              fontWeight: FontWeight.w600),
                        ),
                  isPlaying
                      ? IconButton(
                          onPressed: handlePause,
                          icon: Icon(
                            Icons.pause_circle_outline,
                            color: yellowColor,
                            size: 100,
                          ))
                      : IconButton(
                          onPressed: handleStopWatch,
                          icon: Icon(
                            Icons.play_circle_outline,
                            color: yellowColor,
                            size: 100,
                          ))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectBtn(yellowColor, navyColor, redColor, 3),
                SelectBtn(yellowColor, navyColor, redColor, 6),
                SelectBtn(yellowColor, navyColor, redColor, 9),
                SelectBtn(yellowColor, navyColor, redColor, 12),
                SelectBtn(yellowColor, navyColor, redColor, 15),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: yellowColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        widthFactor: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ROUND",
                              style: TextStyle(
                                color: navyColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "$round",
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Text("/"),
                                Text("$roundFull"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 160,
                        width: 2,
                        color: navyColor,
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "GOAL",
                              style: TextStyle(
                                color: navyColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "$goal",
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Text("/"),
                                Text("$goalFull"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding SelectBtn(
      Color yellowColor, Color navyColor, Color redColor, int selSec) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: yellowColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: () {
            handleSelect(selSec);
          },
          child: Text(
            "$selSec",
            style: TextStyle(
              color: isResting ? navyColor : redColor,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
