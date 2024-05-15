import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyWidget {
  bool _mobile = false;

  bool get mobile => _mobile;

  Widget myBackButton(BuildContext context, String router, Color color) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: InkWell(
          onTap: () {
            context.go(router);
          },
          child: Icon(
            Icons.arrow_back,
            color: color,
          ),
        ),
      ),
    );
  }

  myShowSnackBar1(BuildContext context, String msg) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey,
        duration: const Duration(milliseconds: 1500),
        content: Text(msg),
      ),
    );
  }

/*
 텍스트 스타일
*/
  Widget h1Text(String str, Color color) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          str,
          style: TextStyle(
            fontSize: 20,
            color: color,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  //사이즈가 800이상이면 이미지 up 구글 아이콘에 텍스트 생성
  void mobileCheck(double width) {
    if (width <= 900) {
      print("900이하 모바일로 추정");
      _mobile = true;
    } else {
      print("900이상 pc로 추정");
      _mobile = false;
    }
  }
}
