import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:googlehomepage/main.dart';
import 'package:googlehomepage/page/googleKeyword1_view.dart';
import 'package:googlehomepage/page/helpPage_view.dart';
import 'package:googlehomepage/page/infoPage_view.dart';
import 'package:googlehomepage/page/startPage_view.dart';
import 'package:googlehomepage/page/mainPage_view.dart';

class MyRouter {
  final GoRouter router = GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyWidget(),
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
      builder: (BuildContext context, GoRouterState state) => const InfoPage(),
    ),
    /* 
    도움말
    */
    GoRoute(
      name: 'help',
      path: '/help',
      builder: (BuildContext context, GoRouterState state) => const HelpPage(),
    ),
    GoRoute(
      path: '/googleKeyword1',
      name: 'googleKeyword1',
      builder: (context, state) => const GoogleKeyword1(),
    ),
  ]);
}
