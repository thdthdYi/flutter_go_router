import 'package:flutter_go_router_example/screen/1_basic_screen.dart';
import 'package:flutter_go_router_example/screen/2_named_screen.dart';
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
            })
      ]),
]);
