import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

//App 클래스는 앱 실행의 첫 루트라고 생각하면 된다.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int round = 0, goal = 0;
  bool isPlaying = false;
  num min = 00;
  num sec = 10;
  int totalSec = 00 * 60 + 10;
  String minSt = "00", secSt = "10";
  Timer timer = Timer(const Duration(), () {});

  void handleStopWatch() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (totalSec == 0) {
          round++;
          goal++;
          totalSec = 10;
        }
        if (goal == 1) {
          isPlaying = false;
          timer.cancel();
          minSt = "00";
          secSt = "10";
          totalSec = 00 * 60 + 10;
          round = 0;
          goal = 0;
          return;
        }

        isPlaying = true;
        totalSec = totalSec - 1;
        min = totalSec ~/ 60;
        sec = totalSec % 60;
        minSt = min.toString().padLeft(2, "0");
        secSt = sec.toString().padLeft(2, "0");
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
      minSt = "00";
      secSt = "10";
      totalSec = 00 * 60 + 10;
    });
  }

  @override
  //모든 위젯에는 build 메소드를 포함해야 한다.
  Widget build(BuildContext context) {
    const Color yellowColor = Color.fromRGBO(241, 233, 211, 1);
    const Color navyColor = Color.fromRGBO(30, 35, 68, 1);
    return MaterialApp(
      //BuildContext 클래스는 다 같은 테마데이터를 공유하고 따라서 그걸 다른 클래스에서도 사용가능!
      theme: ThemeData(
          textTheme: const TextTheme(
        titleSmall: TextStyle(
          color: navyColor,
          fontSize: 200,
          fontWeight: FontWeight.w600,
        ),
      )),
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(226, 88, 95, 1),
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
                        child: const Icon(
                          color: yellowColor,
                          Icons.bar_chart_sharp,
                        ),
                      ),
                      TextButton(
                          onPressed: handleSkip,
                          child: const Text(
                            "SKIP",
                            style: TextStyle(
                              color: yellowColor,
                              fontSize: 10,
                            ),
                          )),
                    ],
                  ),
                  Text(
                    "$minSt : $secSt",
                    style: const TextStyle(
                      color: yellowColor,
                      fontSize: 120,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  isPlaying
                      ? IconButton(
                          onPressed: handlePause,
                          icon: const Icon(
                            Icons.pause_circle_outline,
                            color: yellowColor,
                            size: 100,
                          ))
                      : IconButton(
                          onPressed: handleStopWatch,
                          icon: const Icon(
                            Icons.play_circle_outline,
                            color: yellowColor,
                            size: 100,
                          ))
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      color: yellowColor,
                      borderRadius: BorderRadius.only(
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
                            const Text(
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
                                const Text("4"),
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
                            const Text(
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
                                const Text("4"),
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
}
