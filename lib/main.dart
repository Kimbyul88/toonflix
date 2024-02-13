import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

//App 클래스는 앱 실행의 첫 루트라고 생각하면 된다.
class App extends StatelessWidget {
  @override
  //모든 위젯에는 build 메소드를 포함해야 한다.
  Widget build(BuildContext context) {
    //Materialapp을 리턴하면 구글 느낌!
    return MaterialApp(
      //scaffold는 공장의 스캐폴드 역할을 한다.
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 23, 23, 23),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Hey, Selena",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Welcome back",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
