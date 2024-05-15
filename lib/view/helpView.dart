import 'package:flutter/material.dart';
import 'package:googlehomepage/common/myWidget.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [MyWidget().myBackButton(context, "/list", Colors.yellow.shade600), Text("도움")],
        ),
      ),
    );
  }
}
