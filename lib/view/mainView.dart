import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:googlehomepage/common/myWidget.dart';
import 'package:googlehomepage/viewModel/firebaseConnection.dart';
import 'package:googlehomepage/viewModel/mainViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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

  // Future<dynamic> asa = MainViewModel().getGuestBookData();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    // MainViewModel().asad();

    print("@@@@@init Start@@@@@");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    MyWidget().mobileCheck(width);
    ValueChanged<String>? onChanged;
    String guestName = "";
    String guestPassword = "";
    String guestContent = "";

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              // height: height,
              // width: width,
              child: Column(
                children: [
                  MyWidget().myBackButton(context, "/start", Colors.red),
                  SizedBox(
                    height: 150,
                    child: MyWidget().h1Text("구글의 목표는 전 세계의 정보를 체계화하여 모두가 편리 하게 이용 할 수 있도록 하는 것입니다.", Colors.black),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 7,
                    runSpacing: 10,
                    children: [
                      MainViewModel().googleKeyword("2023년 올해의 검색어", context, Colors.blue, "/googleKeyword1"),
                      MainViewModel().googleKeyword("구글 스토리", context, Colors.red, "/googleKeyword1"),
                      MainViewModel().googleKeyword("google for Korea", context, Colors.yellow.shade600, "/googleKeyword1"),
                      MainViewModel().googleKeyword("구글 검색 25주년", context, Colors.blue, "/googleKeyword1"),
                      MainViewModel().googleKeyword("구글의 약속", context, Colors.green, "/googleKeyword1"),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_horiz,
                          color: Colors.red,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: width,
              height: width * 1.2 + 150,
              child: Stack(
                children: [
                  for (int i = 0; i < 2; i++)
                    for (int j = 0; j < 11; j++) MainViewModel().googleItemIcon(i, j, width, j + 1),
                  Positioned(
                    top: 150,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      width: width * 1.2,
                      height: width * 1.2,
                      "assets/images/earth.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 150,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "모두를 위한 유용한 제품",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200,
                              height: 40,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: const InputDecoration(
                                  hintText: "서비스명",
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(0),
                                  //가운데정렬
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height,
              child: Center(
                child: MyWidget().h1Text("Google의 기술을 통해 더 많은 사람들이 혜택을 얻을 수 있도록 돕습니다.", Colors.black),
              ),
            ),
            MyWidget().h1Text("방명록", Colors.black),
            Container(
              padding: const EdgeInsets.all(20),
              height: 200,
              width: width,
              child: StreamBuilder(
                stream: firestore.collection('guestBook').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
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
                  child: Padding(
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
                                onChanged: (value) {
                                  guestName = value;
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
                                obscureText: true,
                                key: const ValueKey("guestPasswordKey"),
                                onSaved: (value) {
                                  guestPassword = value!;
                                },
                                onChanged: (value) {
                                  guestPassword = value;
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
                          onChanged: (value) {
                            guestContent = value;
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
                        Consumer<MainViewModel>(
                          builder: (context, provider, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      print(guestName);
                                      print(guestPassword);
                                      print(guestContent);
                                      if (formKey.currentState!.validate()) {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                actions: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      TextButton(
                                                        onPressed: () {
                                                          MainViewModel().guestBookWrite(
                                                            name: guestName,
                                                            content: guestContent,
                                                            password: guestPassword,
                                                          );
                                                          MyWidget().myShowSnackBar1(context, "저장되었습니다.");
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: const Text("저장"),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: const Text("취소"),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            }).then((value) {
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
                              ],
                            );
                          },
                        ),
                      ]),
                    ),
                  ), //글쓰기
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
            SizedBox(
              height: 70,
            ),
          ]),
        ),
      ),
    );
  }
}
