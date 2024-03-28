import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(alignment: Alignment.center, children: [
          Stack(children: [
            Row(
              children: [
                text(size.height, Colors.blue, "G"),
                text(size.height, Colors.red, "o"),
                text(size.height, Colors.yellow.shade700, "o"),
                text(size.height, Colors.blue, "g"),
                text(size.height, Colors.green, "l"),
                text(size.height, Colors.red, "e"),
              ],
            ),
          ]),
          Positioned(
            top: size.height * 0.5 + 50,
            child: ElevatedButton(
              onPressed: () {
                context.go("/list");
              },
              child: const Text(
                "시작하기",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

Widget text(double height, Color color, String str) {
  return Flexible(
    flex: 1,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: color,
          height: height,
        ),
        Positioned(
          left: 0,
          right: 0,
          child: Text(
            str,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 50, fontWeight: FontWeight.w700, fontFamily: "NotoSansKR", color: Colors.white),
          ),
        )
      ],
    ),
  );
}
