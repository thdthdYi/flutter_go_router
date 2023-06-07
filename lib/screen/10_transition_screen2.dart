import 'package:flutter/material.dart';
import 'package:flutter_go_router_example/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class TransitionScreentwo extends StatelessWidget {
  const TransitionScreentwo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: Container(
      color: Colors.blue,
      child: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('POP'))
        ],
      ),
    ));
  }
}
