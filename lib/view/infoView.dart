import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:googlehomepage/common/myWidget.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> _content = [
      "개발자",
      "목적",
      "개발시작",
      "개발종료(예정)",
    ];
    List<String> _content2 = [
      "장인영",
      "포트폴리오",
      "24-03-19",
      "24-04-19",
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          MyWidget().myBackButton(context, "/list", Colors.blue),
          Expanded(
            child: SizedBox(
              height: 500,
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _content[index],
                          //textAlign: TextAlign.right,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          _content2[index],
                          //textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 20);
                },
                itemCount: _content.length,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
