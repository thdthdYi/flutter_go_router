import 'package:flutter/material.dart';
import 'package:flutter_go_router_example/screen/10_transition_screen2.dart';
import 'package:flutter_go_router_example/screen/11_error_screen.dart';
import 'package:flutter_go_router_example/screen/1_basic_screen.dart';
import 'package:flutter_go_router_example/screen/2_named_screen.dart';
import 'package:flutter_go_router_example/screen/3_push_screen.dart';
import 'package:flutter_go_router_example/screen/4_pop_base_screen.dart';
import 'package:flutter_go_router_example/screen/5_pop_return_screen.dart';
import 'package:flutter_go_router_example/screen/6_path_param_screen.dart';
import 'package:flutter_go_router_example/screen/7_query_parameter.dart';
import 'package:flutter_go_router_example/screen/8_nasted_screen.dart';
import 'package:flutter_go_router_example/screen/8_nested_child_screen.dart';
import 'package:flutter_go_router_example/screen/9_login_screen.dart';
import 'package:flutter_go_router_example/screen/9_private_screen.dart';
import 'package:go_router/go_router.dart';

import '../screen/10_transition_screen1.dart';
import '../screen/root_screen.dart';

//auth의 상태에 따라 로그인이 됐는지 안됐는지 확인한다고 가정.
bool authState = false;

// '/' > home
// basic > basic screen
// named
final router = GoRouter(
    //모든 router에 적용되는 옵션
    redirect: (context, state) {
      //return string(path) > 해당 라우트로 이동 (path)
      //return null > 원래 이동하려던 라우트로 이동

      if (state.location == '/login/private' && !authState) {
        return '/login';
      }
    },
    routes: [
      GoRoute(
        path: '/',
        //path에 해당하는 화면 지정
        builder: (context, state) =>
            //이동할 페이지 반환
            const RootScreen(),
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
          GoRoute(
            //pop
            path: 'query_param',
            builder: (context, state) {
              return const QueryParameterScreen();
            },
          ),
          ShellRoute(
            builder: (context, state, child) => NestedScreen(child: child),
            //child는 아래의 routhes에서 rendering됌.

            routes: [
              // /nested/a
              GoRoute(
                path: 'nested/a',
                builder: (_, state) => const NestedChildScreen(
                  routeName: '/nested/a',
                ),
              ),
              GoRoute(
                path: 'nested/b',
                builder: (_, state) => const NestedChildScreen(
                  routeName: '/nested/b',
                ),
              ),
              GoRoute(
                path: 'nested/c',
                builder: (_, state) => const NestedChildScreen(
                  routeName: '/nested/c',
                ),
              )
            ],
          ),
          GoRoute(
            path: 'login',
            builder: (context, state) => const LoginScreen(),
            routes: [
              GoRoute(
                path: 'private',
                builder: (context, state) => const PrivateScreen(),
              ),
            ],
          ),
          GoRoute(
            path: 'login2',
            builder: (context, state) => const LoginScreen(),
            routes: [
              GoRoute(
                  path: 'private',
                  builder: (context, state) => const PrivateScreen(),
                  redirect: (context, state) {
                    if (!authState) {
                      return 'login2';
                    }
                    return null;
                  }),
            ],
          ),
          GoRoute(
              path: 'transition',
              builder: (_, state) => const TransitionScreenOne(),
              routes: [
                GoRoute(
                    path: 'detail',
                    pageBuilder: (_, state) => CustomTransitionPage(
                        child: const TransitionScreentwo(),
                        transitionsBuilder:
                            ((context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        }))),
              ])
        ],
      ),
    ],
    //gorouter의 error가 난 경우
    errorBuilder: (context, state) =>
        ErrorScreen(error: state.error.toString()),
    //로그 보는 법 > goroute의 action을 로그로 볼 수 있음
    debugLogDiagnostics: true);
