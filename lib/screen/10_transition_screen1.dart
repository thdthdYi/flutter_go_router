import 'package:flutter/material.dart';
import 'package:flutter_go_router_example/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class TransitionScreenOne extends StatelessWidget {
  const TransitionScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Container(
        color: Colors.red,
        child: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  context.go('/transition/detail');
                },
                child: const Text('Go to Detail'))
          ],
        ),
      ),
    );
  }
}
