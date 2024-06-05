import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:googlehomepage/main.dart';
import 'package:googlehomepage/view/googleKeyword1_view.dart';
import 'package:googlehomepage/view/helpView.dart';
import 'package:googlehomepage/view/infoView.dart';
import 'package:googlehomepage/view/startView.dart';
import 'package:googlehomepage/view/mainView.dart';

class MyRouter {
  final GoRouter router = GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const StartPage(),
    ),

    /* 
    처음화면 
    */
    GoRoute(
      name: 'start',
      path: '/start',
      builder: (BuildContext context, GoRouterState state) => const StartPage(),
    ),

    /* 
    신규가입 & 계정 찾기 
    */
    GoRoute(
      name: 'list',
      path: '/list',
      builder: (BuildContext context, GoRouterState state) =>  ListPage(),
    ),

    /* 
    개발정보
    */
    GoRoute(
      name: 'Info',
      path: '/Info',
      builder: (BuildContext context, GoRouterState state) => const InfoView(),
    ),
    /* 
    도움말
    */
    GoRoute(
      name: 'help',
      path: '/help',
      builder: (BuildContext context, GoRouterState state) => const HelpView(),
    ),
    GoRoute(
      path: '/googleKeyword1',
      name: 'googleKeyword1',
      builder: (context, state) => const GoogleKeyword1(),
    ),
  ]);
}
