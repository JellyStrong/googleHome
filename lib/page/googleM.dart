import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoogleMobile extends StatefulWidget {
  const GoogleMobile({super.key});

  @override
  State<GoogleMobile> createState() => _GoogleMobileState();
}

class _GoogleMobileState extends State<GoogleMobile> {
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    ScrollController _scrollController = ScrollController();

    double maxWidth = sizeWidth >= 500 ? 200 : sizeWidth;
    double maxheight = sizeHeight >= 500 ? 200 : sizeHeight;

    bool mobile = Platform.isAndroid || Platform.isIOS;
    bool web = Platform.isWindows || Platform.isMacOS;

    void initState() {
      _scrollController.addListener(() {
        print("-------");
        setState(() {
          print("-------");
        });
      });
      super.initState();
    }

    void dispose() {
      _scrollController.dispose();
      super.dispose();
    }

    return Scaffold(
      body: Container(
        height: sizeHeight,
        color: Colors.amber[300],
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          horizontalLine(),
          SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              vericalLine(),
              googleText(
                "g.png",
                maxWidth,
                maxheight,
                const Positioned(
                  top: 200,
                  right: 5,
                  child: SizedBox(
                    width: 160,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "구글은 제품을 통해 삶을 편리하게 합니다.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              vericalLine(),
              googleText(
                "o.png",
                maxWidth,
                maxheight,
                const Positioned(
                  top: 200,
                  right: 5,
                  child: SizedBox(
                    width: 160,
                    child: Text(
                      "구글은 가능한 많은 사람의 삶에 긍정적인 변화를 가져올 수 있도록 최선을 다 합니다.",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              vericalLine(),
              googleText(
                "o.png",
                maxWidth,
                maxheight,
                const Positioned(
                  top: 200,
                  right: 5,
                  child: SizedBox(
                    width: 160,
                    child: Text(
                      "구글의 목표는 전 세계의 정보를 체계화하여 모두가 편리 하에 이용할 수 있도록 하는 것입니다.",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              vericalLine(),
              googleText(
                "g.png",
                maxWidth,
                maxheight,
                const Positioned(
                  top: 200,
                  right: 5,
                  child: SizedBox(
                    width: 160,
                    child: Text(
                      "구글의 목표는 전 세계의 정보를 체계화하여 모두가 편리 하에 이용할 수 있도록 하는 것입니다.",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              vericalLine(),
              googleText(
                "l.png",
                maxWidth,
                maxheight,
                const Positioned(
                  top: 200,
                  right: 5,
                  child: SizedBox(
                    width: 160,
                    child: Text(
                      "",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              vericalLine(),
              googleText(
                "e.png",
                maxWidth,
                maxheight,
                const Positioned(
                  top: 120,
                  right: 113,
                  child: SizedBox(
                    width: 160,
                    child: Text(
                      "구글의 목표는 전 세계의 정보를 체계화하여 모두가 편리 하에 이용할 수 있도록 하는 것입니다.",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              vericalLine(),
            ]),
          ),
          horizontalLine(),
          const SizedBox(height: 10),
          horizontalLine(),
          const Text("아래로"),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.arrow_drop_down_sharp,
              size: 50,
            ),
          ),
        ]),
      ),
    );
  }
}

Widget horizontalLine() {
  return Container(
    width: 1000,
    height: 4,
    color: Colors.red.shade400,
  );
}

Widget vericalLine() {
  return Container(
    width: 4,
    height: 500,
    color: Colors.red.shade400,
  );
}

Widget googleText(String url, double width, double height, Widget child) {
  print(width);
  return Stack(children: [
    Image.asset(
      width: width,
      height: height,
      "assets/images/google_text/${url.toString()}",
      fit: BoxFit.fill,
    ),
    child,
  ]);
}
