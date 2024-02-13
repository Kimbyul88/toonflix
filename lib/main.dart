import 'package:flutter/material.dart';
import 'package:toonflix/widgets/schedule.dart';

void main() {
  runApp(const App());
}

//App 클래스는 앱 실행의 첫 루트라고 생각하면 된다.
class App extends StatelessWidget {
  const App({super.key});
  final todayDate = 17;
  @override
  //모든 위젯에는 build 메소드를 포함해야 한다.
  Widget build(BuildContext context) {
    //Materialapp을 리턴하면 구글 느낌!
    return MaterialApp(
      //scaffold는 공장의 스캐폴드 역할을 한다.
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 31, 31, 31),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(190, 130, 100, 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    const Icon(
                      Icons.publish,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "MONDAY 16",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const Text(
                        "TODAY",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(179, 38, 127, 1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Text(
                        "$todayDate",
                        style: const TextStyle(
                            color: Color.fromRGBO(141, 141, 141, 1),
                            fontSize: 50),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "${todayDate + 1}",
                        style: const TextStyle(
                            color: Color.fromRGBO(141, 141, 141, 1),
                            fontSize: 50),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "${todayDate + 2}",
                        style: const TextStyle(
                            color: Color.fromRGBO(141, 141, 141, 1),
                            fontSize: 50),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "${todayDate + 3}",
                        style: const TextStyle(
                            color: Color.fromRGBO(141, 141, 141, 1),
                            fontSize: 50),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Schedule(
                    bgColor: Color.fromRGBO(255, 247, 84, 1),
                    hr1: "11",
                    m1: "30",
                    hr2: "12",
                    m2: "20",
                    title: "DESIGN\nMEETING",
                    name1: "ALEX",
                    name2: "HELENA",
                    name3: "NANA",
                    morethan3: false,
                    moremany: 0,
                    isMe: false),
                const SizedBox(
                  height: 10,
                ),
                const Schedule(
                    bgColor: Color.fromRGBO(157, 107, 206, 1),
                    hr1: "12",
                    m1: "35",
                    hr2: "14",
                    m2: "10",
                    title: "DAILY\nPROJECT",
                    name1: "ME",
                    name2: "RICHARD",
                    name3: "CIRY",
                    morethan3: true,
                    moremany: 4,
                    isMe: true),
                const SizedBox(
                  height: 10,
                ),
                const Schedule(
                    bgColor: Color.fromRGBO(188, 238, 75, 1),
                    hr1: "15",
                    m1: "00",
                    hr2: "16",
                    m2: "30",
                    title: "WEEKLY\nPLANNING",
                    name1: "DEN",
                    name2: "NANA",
                    name3: "MARK",
                    morethan3: false,
                    moremany: 0,
                    isMe: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
