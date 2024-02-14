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
  bool isVisible = true;

  void titleVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  //모든 위젯에는 build 메소드를 포함해야 한다.
  Widget build(BuildContext context) {
    return MaterialApp(
      //BuildContext 클래스는 다 같은 테마데이터를 공유하고 따라서 그걸 다른 클래스에서도 사용가능!
      theme: ThemeData(
          textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.red,
        ),
      )),
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isVisible ? const MyLargeTitle() : const Text("nothing"),
              IconButton(
                  onPressed: titleVisible,
                  icon: const Icon(Icons.remove_red_eye)),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    //build 메소드 전에 실행되는 함수!(무조건)
    super.initState();
    print("initState");
  }

  @override
  void dispose() {
    //위젯이 삭제되었을 때 실행되는 함수!
    super.dispose();
    print("disposed");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Text(
      "My Large Title",
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
