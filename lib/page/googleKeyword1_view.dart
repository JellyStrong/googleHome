import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoogleKeyword1 extends StatefulWidget {
  const GoogleKeyword1({super.key});

  @override
  State<GoogleKeyword1> createState() => _GoogleKeyword1State();
}

class _GoogleKeyword1State extends State<GoogleKeyword1> {
  late WebViewController _controller = WebViewController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      //..loadRequest(Uri.parse(""))
      ..loadFlutterAsset("assets/webview.html");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
