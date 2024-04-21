import 'package:flutter/material.dart';
import 'package:googlehomepage/common/myWidget.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [myBackButton(context, "/list", Colors.yellow.shade600), Text("도움")],
        ),
      ),
    );
  }
}
