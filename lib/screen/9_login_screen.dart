import 'package:flutter/material.dart';
import 'package:flutter_go_router_example/layout/default_layout.dart';
import 'package:flutter_go_router_example/route/router.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: ListView(
      children: [
        Text('Login State : $authState'),
        ElevatedButton(
            onPressed: () {
              setState(() {
                authState = !authState;
              });
            },
            child: Text(
              authState ? 'logout' : 'login',
            )),
        ElevatedButton(
            onPressed: () {
              //주소 확인 마찬가지.
              //맨 앞에 '/' 넣어주는 걸 잊지말 것.
              if (GoRouterState.of(context).location == '/login') {
                context.go('/login/private');
              } else {
                context.go('/login2/private');
              }
            },
            child: const Text('Go to Private Route'))
      ],
    ));
  }
}
