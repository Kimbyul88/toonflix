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
  List<int> numbers = [];
  void onClicked() {
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  //모든 위젯에는 build 메소드를 포함해야 한다.
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Click Count",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              for (var n in numbers) Text("$n"),
              IconButton(
                  iconSize: 50,
                  onPressed: onClicked,
                  icon: const Icon(Icons.add_box_rounded)),
            ],
          ),
        ),
      ),
    );
  }
}
