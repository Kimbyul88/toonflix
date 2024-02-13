import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
  final Color bgColor;
  final String hr1, m1, hr2, m2;
  final String title, name1, name2, name3;
  final bool morethan3;
  final int moremany;
  final bool isMe;
  const Schedule(
      {super.key,
      required this.bgColor,
      required this.hr1,
      required this.m1,
      required this.hr2,
      required this.m2,
      required this.title,
      required this.name1,
      required this.name2,
      required this.name3,
      required this.morethan3,
      required this.moremany,
      required this.isMe});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 50, 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.translate(
              offset: const Offset(0, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    hr1,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 25),
                  ),
                  Text(
                    m1,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                  Container(
                    height: 20,
                    width: 1,
                    color: Colors.black,
                  ),
                  Text(
                    hr2,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 25),
                  ),
                  Text(
                    m2,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 50,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      name1,
                      style: TextStyle(
                        color: isMe
                            ? Colors.black
                            : const Color.fromARGB(255, 120, 120, 120),
                        fontWeight: isMe ? FontWeight.w600 : FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      name2,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 120, 120, 120)),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      name3,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 120, 120, 120)),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    morethan3
                        ? Text(
                            "+$moremany",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 120, 120, 120)),
                          )
                        : const Text(""),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
