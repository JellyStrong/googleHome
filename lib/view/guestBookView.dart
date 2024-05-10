import 'package:flutter/material.dart';

void guestBookDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false, //바깥영역 클릭시 닫힘 유무
      context: context,
      builder: ((context) {
        return AlertDialog(
          //title: Text("글쓰기"),
          content: SizedBox(
            height: 200,
            child: Column(
              children: [
                Row(
                  children: [
                    Text("방명록 남기기"),
                    Icon(
                      Icons.close_rounded,
                      color: Colors.grey,
                    )
                  ],
                ),
              ],
            ),
          ),
          actions: [
            Container(
                child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("저장"),
            )),
            Container(
                child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("취소"),
            ))
          ],
        );
      })).then((value) {
    //Navigator.pop 의 reutrn값
  }).whenComplete(() {
    //다이얼로그가 종료되었을때 호출
  });
}
