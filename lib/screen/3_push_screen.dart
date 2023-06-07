import 'package:flutter/material.dart';
import 'package:flutter_go_router_example/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class PushScreen extends StatelessWidget {
  const PushScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: ListView(
      children: [
        ElevatedButton(
            onPressed: () {
              //바로 전 route로 이동
              context.push('/basic');
            },
            child: const Text('Push Basic')),
        ElevatedButton(
            onPressed: () {
              //제일 상위 route로 이동
              context.go('/basic');
            },
            child: const Text('Go Basic'))
      ],
    ));
  }
}
