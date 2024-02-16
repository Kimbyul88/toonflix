import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
import 'package:toonflix/services/api_service.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const App());
}

//App 클래스는 앱 실행의 첫 루트라고 생각하면 된다.
class App extends StatelessWidget {
  //각 위젯은 위젯을 식별하기 위한 key를 가지고 있고, 그걸 super클래스인 StatelessWidget에게 보낸다.
  const App({super.key});

  @override
  //모든 위젯에는 build 메소드를 포함해야 한다.
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: const HomeScreen(),
      ),
    );
  }
}
