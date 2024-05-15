import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:googlehomepage/common/myWidget.dart';
import 'package:path_provider/path_provider.dart';

//TODO::집에갈까?
class MainViewModel extends ChangeNotifier {
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

  /*
 구글 키워드
 */
  Widget googleKeyword(
      String str, BuildContext context, Color color, String router) {
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
      onHover: (value) => print('ssss'),
      onPressed: () {
        context.go(router);
      },
      child: Text(
        str,
        style: const TextStyle(fontSize: 10, color: Colors.black),
      ),
    );
  }

  // List<List<double>> width = [
  //   [140, 120, 100, 80, 60, 40, 60, 80, 100, 120, 140],
  //   [140, 120, 100, 80, 60, 40, 60, 80, 100, 120, 140]
  // ];
  List<List<double>> heigth = [
    [125, 100, 75, 50, 25, 0, 25, 50, 75, 100, 125],
    [150, 125, 100, 75, 50, 25, 50, 75, 100, 125, 150],
  ];

  ///설명
  Widget googleItemIcon(int i, int j, double deviceWidth, int num) {
    return Positioned(
      left: (deviceWidth / 11) * j,
      top: heigth[i][j],
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 35,
          width: 35,
          child: i == 0
              ? Image.asset(
                  "assets/images/google_item/item${(num).toString()}.png")
              : Image.asset(
                  "assets/images/google_item/item${(num + 10).toString()}.png"),
        ),
      ),
    );
    // print("나 돌고있니?");
    // print(num);
    // return InkWell(
    //   onTap: () {},
    //   child: Container(
    //     height: 35,
    //     width: 35,
    //     child: Image.asset(
    //         "assets/images/google_item/item${(num).toString()}.png
    //         "
    //     )
    //     ,
    //   )
    //   ,
    // );
  }

//pc화면에 보여줄ㄱ꺼 호의길이;;;
//   Widget ggg() {
//     double pie = 3.14;
//     double asdf = 2 * pie * (550 * 0.5);
//     return Positioned(
//       top: i >= 1
//           ? i * (h[j] + 0.1) : double.infinity * h[j],
//       left: double.infinity * (j * w),
//       child:
//
//       InkWell(
//         onTap: () {},
//         child: Container(
//           height: MyWidget().mobile ? 35 : 50,
//           width: MyWidget().mobile ? 35 : 50,
//           child: Image.asset(
//               "assets/images/google_item/item${itemNo.toString()}.png"),
//         ),
//       ),);
//   }

/*
 구글아이콘 아이템
*/
  Widget googleItemIconGroup(double width) {
    print(width);
    double iconTop = width * 0.25; //550 / 5 최대 떠있는부분 2
    double iconLeft = width * 0.04; //550 /4
    int num = 0;
    print(iconTop);
    return Text("");

    // return Stack(children: [
    //   for (int i = 0; i < 2; i++)
    //     for (int j = 0; j < 10; j++)
    //       Positioned(
    //         top:
    //             // iconTop,
    //             i >= 1 ? iconTop : iconTop,
    //         left:
    //             // iconLeft,
    //             iconLeft,
    //         child: googleItemIcon(++num),
    //       )
    // ]);

    //이미지 구분 번호
//     double w = 0.1; //가로 고정
//     List<double> h = [
//       // 높이 고정(각줄마다 가공 필요)
//       0.16,
//       0.13,
//       0.10,
//       0.13,
//       0.08,
//       0.13,
//       0.10,
//       0.16,
//       0.11,
//       0.12
//     ];
//     List<double> hh = [];
//     List<List<double>> hw = [[]]; //2차원 배열
// //각 데이터
//     hw = [
//       [60, 30],
//       [
//         50,
//       ],
//       [40, 0.3],
//       [30, 0.4],
//       [40.08],
//       [
//         50,
//       ],
//       [],
//       []
//     ];
//     // googleItemIcon()
//     Positioned(
//       top: i >= 1 ? double.infinity * (h[j] + 0.1) : double.infinity * h[j],
//       left: double.infinity * (j * w),
//       child: InkWell(
//         onTap: () {},
//         child: Container(
//           height: 35,
//           width: 35,
//           child: Image.asset(
//               "assets/images/google_item/item${(++num).toString()}.png"),
//         ),
//       ),
//     );
//     return Stack(
//       children: [
//         for (int i = 0; i < 2; i++)
//           for (int j = 0; j < 10; j++)
//             Positioned(
//               top: i >= 1
//                   ? double.infinity * (h[j] + 0.1)
//                   : double.infinity * h[j],
//               left: double.infinity * (j * w),
//               child: InkWell(
//                 onTap: () {},
//                 child: Container(
//                   height: 35,
//                   width: 35,
//                   child: Image.asset(
//                       "assets/images/google_item/item${(++num).toString()}.png"),
//                 ),
//               ),
//             )
//       ],
    //   );
  }

  void asad() {
    Future<String> readFile() async {
      try {
        final file = File('assets/google_item_name.txt');
        return file.readAsString();
      } catch (e) {
        return e.toString();
      }
    }

    var aa = readFile();
    print(aa);
    // FutureBuilder(
    //     future: loadAsset('assest/google_itme_name.rtf'),
    //     builder: (context, snapshot) {
    //       return snapshot;
    //     });
  }
}
