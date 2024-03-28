import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:googlehomepage/common/myWidget.dart';
import 'package:googlehomepage/page/googleKeyword1_view.dart';
import 'package:flutter/cupertino.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  //late FToast fToast;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   fToast = FToast();
  //   fToast.init(context);
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     myToast("sad");
  //   });
  //   // myToast("Google에서 제공된 내용을 바탕으로 제작하였습니다.");
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            myBackButton(context, "/start", Colors.red),
            SizedBox(
              height: 150,
              child: h1Text("구글의 목표는 전 세계의 정보를 체계화하여 모두가 편리 하게 이용 할 수 있도록 하는 것입니다.", Colors.black),
            ),
            Wrap(alignment: WrapAlignment.center, spacing: 7, runSpacing: 10, children: [
              googleKeyword("2023년 올해의 검색어", context, "/googleKeyword1"),
              googleKeyword("구글 스토리", context, "/googleKeyword1"),
              googleKeyword("google for Korea", context, "/googleKeyword1"),
              googleKeyword("구글 검색 25주년", context, "/googleKeyword1"),
              googleKeyword("구글의 약속", context, "/googleKeyword1"),
            ]),
            SizedBox(
              height: 250,
              width: 500,
              child: Stack(children: [
                googleItemIcon("1", height * 0.16, width * 0.0),
                googleItemIcon("2", height * 0.13, width * 0.1),
                googleItemIcon("3", height * 0.10, width * 0.2),
                googleItemIcon("4", height * 0.13, width * 0.3),
                googleItemIcon("5", height * 0.08, width * 0.4),
                googleItemIcon("6", height * 0.13, width * 0.5),
                googleItemIcon("7", height * 0.10, width * 0.6),
                googleItemIcon("8", height * 0.16, width * 0.7),
                googleItemIcon("9", height * 0.11, width * 0.8),
                googleItemIcon("10", height * 0.12, width * 0.9),
                //
                googleItemIcon("11", height * 0.26, width * 0.0),
                googleItemIcon("12", height * 0.23, width * 0.1),
                googleItemIcon("13", height * 0.20, width * 0.2),
                googleItemIcon("14", height * 0.23, width * 0.3),
                googleItemIcon("15", height * 0.18, width * 0.4),
                googleItemIcon("16", height * 0.23, width * 0.5),
                googleItemIcon("17", height * 0.20, width * 0.6),
                googleItemIcon("18", height * 0.26, width * 0.7),
                googleItemIcon("19", height * 0.26, width * 0.8),
                googleItemIcon("20", height * 0.23, width * 0.9),
              ]),
            ),
            SizedBox(
              width: 500,
              height: 500,
              child: Stack(alignment: Alignment.centerRight, children: [
                Image.asset(
                  width: 500,
                  height: 500,
                  "assets/images/earth.png",
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  top: 180,
                  left: 100,
                  child: Center(
                    child: Text(
                      "모두를 위한 유용한 제품",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                Positioned(
                  top: 230,
                  left: 60,
                  child: SizedBox(
                      width: 200,
                      height: 40,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: "서비스명",
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            //borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 48),
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      print("클릭");
                    },
                    child: const Text(
                      "검색",
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: size.height,
              child: Center(
                child: h1Text("Google의 기술을 통해 더 많은 사람들이 혜택을 얻을 수 있도록 돕습니다.", Colors.black),
              ),
            ),
            Text("방명록"),
            Text("도움받기"), //고객센터
            InkWell(
              onTap: () {
                context.go("/Info");
              },
              child: Text("개발정보"),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget googleItemIcon(String itemNumber, double top, double left) {
  return Positioned(
    top: top,
    left: left,
    child: InkWell(
      onTap: () {
        print(itemNumber.toString());
      },
      child: Container(
        height: 35,
        width: 35,
        child: Image.asset("assets/images/google_item/item${itemNumber.toString()}.png"),
      ),
    ),
  );
}

Widget googleKeyword(String str, BuildContext context, String router) {
  return ElevatedButton(
    onPressed: () {
      context.go(router);
    },
    child: Text(
      str,
      style: const TextStyle(fontSize: 10),
    ),
  );
}

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
