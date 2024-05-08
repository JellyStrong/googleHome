import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:googlehomepage/common/route.dart';
import 'package:googlehomepage/model/mainPageModel.dart';

// import 'package:googlehomepage/page/google.dart';
// import 'package:googlehomepage/page/googleM.dart';
import 'package:googlehomepage/page/startPageView.dart';

// import 'dart:io' show Platform;
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDefault();
  runApp(const MyApp());
}

//라우터
MyRouter _myRouter = MyRouter();

Future<void> initializeDefault() async {
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('Initialized default app $app');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) {
          return Data();
        })
      ],
      child: MaterialApp.router(
        routerConfig: _myRouter.router,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "NotoSansKR",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: StartPage(),
      ),
    );
  }
}
