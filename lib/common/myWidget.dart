import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyWidget extends ChangeNotifier {
  bool _mobile = false;
  double _changeWidth = 0;

  bool get mobile => _mobile;
  double get changeWidth => _changeWidth;
   set changeWidth(double value) => _changeWidth;

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
  bool mobileCheck(double deviceWidth) {
    _changeWidth =deviceWidth;
    if (deviceWidth <= 1200) {
      print("1200이하 모바일로 추정");
      notifyListeners();
      _mobile = true;
    } else {
      print("1200이상 pc로 추정");
      notifyListeners();
      _mobile = false;
    }
    return _mobile;
  }
}
