import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:googlehomepage/model/mainPageModel.dart';

class MainPageController extends ChangeNotifier {
  bool _showGuestForm = false;

  bool get showGuestForm => _showGuestForm;
  Map<String, dynamic> _guestList = {};

  Map<String, dynamic> get guestList => _guestList;
  String test3 = '';
  String _name = "";

  String get name => _name;

  /*
  * 게스트북 방문글 추가,취소 버튼 show hide
  * */
  showGuestFormFC() {
    _showGuestForm = !_showGuestForm;
    notifyListeners();
  }

  Future getGuestBookData() async {
    print('firebase에서 데이터 처리');
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot<Map<String, dynamic>> result = await firestore
        .collection('guestBook')
        .doc('NKHhHh4KGRx01tC3wX57')
        .get();

    Map<String, dynamic>? resultData = result.data();

    //print(resultData.runtimeType); //Map<String,dynamic>

    return resultData;
  }

  test() async {
    DocumentSnapshot<Map<String, dynamic>> a = await FirebaseFirestore.instance
        .collection('guestBook')
        .doc('NKHhHh4KGRx01tC3wX57')
        .get();

    Map<String, dynamic>? result = a.data();

    print('aaaaa-----');
    print(result.runtimeType);
    return result;
  }

//값에 변화가 있을때 발생!!!!!!
  resultGuestBook() {
    //위에 async를 사용을 하여 리턴값은 퓨처로 반홤됌.
    Future<dynamic> getData = MainPageController().getGuestBookData();
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

  test1() {
    //위에 async를 사용을 하여 리턴값은 퓨처로 반홤됌.
    Map<String, dynamic> guestList;
    Future<dynamic> getDatas = MainPageController().getGuestBookData();
    /* guestList = {};

    getDatas.then((value) {
      print(value);
      guestList = value;
    }).catchError((error) {
      guestList = error;
    });*/

    return getDatas;
  }

  test2() {
    var dd = FirebaseFirestore.instance.collection('guestBook').snapshots();

    dd.listen((event) async {
      await FirebaseFirestore.instance
          .collection('guestBook')
          .doc('NKHhHh4KGRx01tC3wX57')
          .get()
          .then((value) async {
        _name = value.data()?['name'];
      });
      //  notifyListeners();
    });
  }
}
