//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:googlehomepage/common/myWidget.dart';
import 'package:googlehomepage/viewModel/firebaseConnection.dart';
import 'package:googlehomepage/viewModel/mainViewModel.dart';
import 'package:googlehomepage/model/mainModel.dart';
import 'package:googlehomepage/view/googleKeyword1_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:googlehomepage/viewModel/mainViewModel.dart';
import 'package:provider/provider.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class ListPage extends StatefulWidget {
  ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final formKey = GlobalKey<FormState>();

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

  Future<dynamic> asa = MainViewModel().getGuestBookData();

  var tt = {};

  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    print("@@@@@init Start@@@@@");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    String guestName = "";
    String guestPassword = "";
    String guestContent = "";
    //  Provider.of<MainPageController>(context).test2();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            myBackButton(context, "/start", Colors.red),
            SizedBox(
              height: 150,
              child: h1Text(
                  "구글의 목표는 전 세계의 정보를 체계화하여 모두가 편리 하게 이용 할 수 있도록 하는 것입니다.",
                  Colors.black),
            ),
            Wrap(
                alignment: WrapAlignment.center,
                spacing: 7,
                runSpacing: 10,
                children: [
                  MainViewModel().googleKeyword(
                      "2023년 올해의 검색어", context, Colors.blue, "/googleKeyword1"),
                  MainViewModel().googleKeyword(
                      "구글 스토리", context, Colors.red, "/googleKeyword1"),
                  MainViewModel().googleKeyword("google for Korea", context,
                      Colors.yellow.shade600, "/googleKeyword1"),
                  MainViewModel().googleKeyword(
                      "구글 검색 25주년", context, Colors.blue, "/googleKeyword1"),
                  MainViewModel().googleKeyword(
                      "구글의 약속", context, Colors.green, "/googleKeyword1"),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                        color: Colors.red,
                        size: 26,
                      )),
                ]),
            SizedBox(
              height: 260,
              width: 500,
              child: Stack(children: [
                MainViewModel().googleItemIcon("1", height * 0.16, width * 0.0),
                MainViewModel().googleItemIcon("2", height * 0.13, width * 0.1),
                MainViewModel().googleItemIcon("3", height * 0.10, width * 0.2),
                MainViewModel().googleItemIcon("4", height * 0.13, width * 0.3),
                MainViewModel().googleItemIcon("5", height * 0.08, width * 0.4),
                MainViewModel().googleItemIcon("6", height * 0.13, width * 0.5),
                MainViewModel().googleItemIcon("7", height * 0.10, width * 0.6),
                MainViewModel().googleItemIcon("8", height * 0.16, width * 0.7),
                MainViewModel().googleItemIcon("9", height * 0.11, width * 0.8),
                MainViewModel()
                    .googleItemIcon("10", height * 0.12, width * 0.9),
                //
                MainViewModel()
                    .googleItemIcon("11", height * 0.26, width * 0.0),
                MainViewModel()
                    .googleItemIcon("12", height * 0.23, width * 0.1),
                MainViewModel()
                    .googleItemIcon("13", height * 0.20, width * 0.2),
                MainViewModel()
                    .googleItemIcon("14", height * 0.23, width * 0.3),
                MainViewModel()
                    .googleItemIcon("15", height * 0.18, width * 0.4),
                MainViewModel()
                    .googleItemIcon("16", height * 0.23, width * 0.5),
                MainViewModel()
                    .googleItemIcon("17", height * 0.20, width * 0.6),
                MainViewModel()
                    .googleItemIcon("18", height * 0.26, width * 0.7),
                MainViewModel()
                    .googleItemIcon("19", height * 0.26, width * 0.8),
                MainViewModel()
                    .googleItemIcon("20", height * 0.23, width * 0.9),
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
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
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
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                          hintText: "서비스명",
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                          filled: true,
                          contentPadding: EdgeInsets.all(0),
                          //가운데정렬
                          enabledBorder: OutlineInputBorder(
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
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: size.height,
              child: Center(
                child: h1Text("Google의 기술을 통해 더 많은 사람들이 혜택을 얻을 수 있도록 돕습니다.",
                    Colors.black),
              ),
            ),
            h1Text("방명록", Colors.black),
            Container(
              padding: const EdgeInsets.all(20),
              height: 200,
              width: width,
              child: StreamBuilder(
                stream: firestore.collection('guestBook').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  final doc = snapshot.data?.docs;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return MainViewModel().guestBookList(doc);
                },
              ),
            ),
            Consumer<MainViewModel>(builder: (context, provider, child) {
              return Column(children: [
                Visibility(
                  visible: provider.showGuestForm,
                  child: writeGuestBook(), //글쓰기
                ),
                Visibility(
                  visible: !provider.showGuestForm,
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      context.read<MainViewModel>().showGuestFormFC();
                    },
                  ),
                ),
              ]);
            }),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    context.go("/help");
                  },
                  child: const Text("도움받기"),
                ), //고객센터
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    context.go("/Info");
                  },
                  child: const Text("개발정보"),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

/*
함수 모음
*/

  Widget writeGuestBook() {
    String guestName = "", guestPassword = "", guestContent = "";

    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Form(
        key: formKey,
        child: Column(children: [
          Row(children: [
            Flexible(
              flex: 1,
              child: SizedBox(
                width: double.infinity * 0.5,
                child: TextFormField(
                  key: const ValueKey("guestNameKey"),
                  onSaved: (value) {
                    guestName = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "\u26A0 입력하세요.";
                    }
                    if (value.length > 7) {
                      return "\u26A0 7자 이하로 입력하세요.";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "이름",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.yellow,
                    filled: true,
                    contentPadding: const EdgeInsets.all(10),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              flex: 1,
              child: SizedBox(
                width: double.infinity * 0.5,
                child: TextFormField(
                  key: const ValueKey("guestPasswordKey"),
                  onSaved: (value) {
                    guestPassword = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "\u26A0 입력하세요.";
                    }
                    if (value.length > 4) {
                      return "\u26A0 4자 이하로 입력하세요.";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "비밀번호",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.blue,
                    filled: true,
                    contentPadding: const EdgeInsets.all(10),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 30),
          TextFormField(
            key: const ValueKey("guestContentKey"),
            onSaved: (value) {
              guestContent = value!;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "\u26A0 입력하세요.";
              }
              if (value.length > 100) {
                return "\u26A0 100자를 초과하였습니다.";
              }
              return null;
            },
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "내용",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.red,
              filled: true,
              contentPadding: const EdgeInsets.all(10),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          Consumer<MainViewModel>(builder: (context, provider, child) {
            return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              actions: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            myShowSnackBar1(context, "저장되었습니다");
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("저장")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("취소")),
                                    ]),
                              ],
                            );
                          }).then((value) {
                        print(">>>>>>>>");
                        print(value);
                        return value;
                      });
                    }
                  },
                  icon: const Icon(Icons.check_outlined)),
              IconButton(
                onPressed: () {
                  context.read<MainViewModel>().showGuestFormFC();
                },
                icon: const Icon(Icons.close_outlined),
              ),
            ]);
          }),
        ]),
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
