import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:googlehomepage/common/myWidget.dart';
import 'package:googlehomepage/model/mainModel.dart';

class MainViewModel extends ChangeNotifier {
  bool _showGuestForm = false;

  bool get showGuestForm => _showGuestForm;

  Map<String, dynamic> _guestList = {};

  Map<String, dynamic> get guestList => _guestList;
  String test3 = '';
  String _name = "";

  String get name => _name;

  ///게스트 북 방문글 추가, 취소 버튼 show/hide
  showGuestFormFC() {
    _showGuestForm = !_showGuestForm;
    notifyListeners();
  }

  Future getGuestBookData() async {
    print('firebase에서 데이터 처리');
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot<Map<String, dynamic>> result = await firestore.collection('guestBook').doc('NKHhHh4KGRx01tC3wX57').get();

    Map<String, dynamic>? resultData = result.data();

    //print(resultData.runtimeType); //Map<String,dynamic>

    return resultData;
  }

//값에 변화가 있을때 발생!!!!!!
  resultGuestBook() {
    //위에 async를 사용을 하여 리턴값은 퓨처로 반홤됌.
    Future<dynamic> getData = MainViewModel().getGuestBookData();
    print("firebase처리 결과값 가공");
    getData.then((value) {
      _guestList = value;
      // notifyListeners();
    }).catchError((error) {
      print(error);
      print("error!!!");
    });
    //return guestList;
  }

  //firebase에서
//순번,이름,내용,등록일 가져오기
  Widget guestBookList(var snapshots) {
    return Container(
      //color: Colors.grey,
      child: Row(
        children: [
          //for (final a in asa)
          Text(snapshots?[0]['name']),
          Text(snapshots?[0]['content']),
          // DateFormat("yyyy년 MM월 dd일").format(_startDate)
          // Text(snapshots[0]['updated_at']),
          //     Text(result['name'].toString()),
        ],
      ),
    );
  }

  ///구글 키워드
  Widget googleKeyword(String str, BuildContext context, Color color, String router) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        side: BorderSide(
          color: color,
          width: 3,
        ),
        shadowColor: color,
      ),
      //onHover: (value) => print('ssss'),
      onPressed: () {
        context.go(router);
      },
      child: Text(
        str,
        style: const TextStyle(fontSize: 10, color: Colors.black),
      ),
    );
  }

  List<List<double>> heigth = [
    // [125, 100, 75, 50, 25, 0, 25, 50, 75, 100, 125],
    // [150, 125, 100, 75, 50, 25, 50, 75, 100, 125, 150],
    [135, 90, 65, 50, 55, 40, 35, 50, 75, 80, 125],
    [175, 155, 130, 85, 100, 85, 100, 95, 120, 125, 170],
  ];

  ///구글 아이템 아이콘
  Widget googleItemIcon(int i, int j, double deviceWidth, int num) {
    Widget asd;


    return Positioned(
      ///(하나의 객체의 크기) + (하나의 객체 크기의 반값)
      left: (deviceWidth / 11 * j) + (((deviceWidth / 11) - 35) / 2),
      top: heigth[i][j],
      // top: i > 0 ? deviceWidth < 1000 ? heigth[i][j] : heigth[i][j] +30 : heigth[i][j],
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 35,
          width: 35,
          // height: deviceWidth < 1000 ? 35 : 70,
          // width: deviceWidth < 1000 ? 35 : 70,
          child: i < 1 ? Image.asset("assets/images/google_item/item${(num).toString()}.png") : Image.asset("assets/images/google_item/item${(++num + 10).toString()}.png"),
        ),
      ),
    );
  }

  ///구글 아이콘 아이템(웹)
  Widget googleItemIconWeb(int i, int j, double deviceWidth, int num) {
    MyWidget().mobileCheck(deviceWidth);

    return Positioned(
      ///(하나의 객체의 크기) + (하나의 객체 크기의 반값)
      left: (deviceWidth / 11 * j) + (((deviceWidth / 11) - 35) / 2),
      top: heigth[i][j],
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 35,
          width: 35,
          child: i < 1 ? Image.asset("assets/images/google_item/item${(num).toString()}.png") : Image.asset("assets/images/google_item/item${(++num + 10).toString()}.png"),
        ),
      ),
    );
  }

///구글 아이콘 아이템그룹
  Widget googleItemIconGroup(double width) {
    print(width);
    double iconTop = width * 0.25; //550 / 5 최대 떠있는부분 2
    double iconLeft = width * 0.04; //550 /4
    int num = 0;
    print(iconTop);
    return Text("");
  }

  /// 파이어베이스 글 쓰기
  Future guestBookWrite({required name, required content, required password}) async {
    final doc = FirebaseFirestore.instance.collection("guestBook").doc();
    final guestBook = GuestBook(name: name, content: content, password: password);
    final json = guestBook.toJSon();

    await doc.set(json);
  }
}
