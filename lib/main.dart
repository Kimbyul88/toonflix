import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

//App 클래스는 앱 실행의 첫 루트라고 생각하면 된다.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Materialapp을 리턴하면 구글 느낌!
    return MaterialApp(
      //scaffold는 공장의 스캐폴드 역할을 한다.
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello flutter!"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Text("Hello world"),
        ),
      ),
    );
  }
}
