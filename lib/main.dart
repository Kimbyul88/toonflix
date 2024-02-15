import 'dart:async';

import 'package:flutter/material.dart';
import 'package:toonflix/screens/pomodoro_self.dart';

void main() {
  runApp(const App());
}

//App 클래스는 앱 실행의 첫 루트라고 생각하면 된다.
class App extends StatelessWidget {
  const App({super.key});

  @override
  //모든 위젯에는 build 메소드를 포함해야 한다.
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xFFE7626C),
        ),
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xfff3eddb),
      ),
      home: const Pomodor(),
    );
  }
}
