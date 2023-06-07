import 'package:flutter_go_router_example/screen/1_basic_screen.dart';
import 'package:flutter_go_router_example/screen/2_named_screen.dart';
import 'package:flutter_go_router_example/screen/3_push_screen.dart';
import 'package:flutter_go_router_example/screen/4_pop_base_screen.dart';
import 'package:flutter_go_router_example/screen/5_pop_return_screen.dart';
import 'package:flutter_go_router_example/screen/6_path_param_screen.dart';
import 'package:go_router/go_router.dart';

import '../screen/root_screen.dart';

// '/' > home
// basic > basic screen
// named
final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    //path에 해당하는 화면 지정
    builder: (context, state) {
      //이동할 페이지 반환
      return const RootScreen();
    },
    routes: [
      GoRoute(
          path: 'basic',
          builder: (context, state) {
            return const BasicScreen();
          }),
      GoRoute(
          path: 'named',
          name: 'named_screen',
          builder: (context, state) {
            return const NamedScreen();
          }),
      GoRoute(
          path: 'push',
          builder: (context, state) {
            return const PushScreen();
          }),
      GoRoute(
          //pop
          path: 'pop',
          builder: (context, state) {
            return const PopBaseScreen();
          },
          routes: [
            GoRoute(
              // pop/return
              path: 'return',
              builder: (context, state) {
                return const PopReturnScreen();
              },
            ),
          ]),
      GoRoute(
          //변수의 값을 가지고 옴 (/:id)
          path: 'path_param/:id',
          builder: (context, state) {
            return const PathParamScreen();
          },
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state) {
                return const PathParamScreen();
              },
            ),
          ]),
    ],
  ),
]);
