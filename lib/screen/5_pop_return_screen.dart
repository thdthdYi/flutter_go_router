import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/default_layout.dart';

class PopReturnScreen extends StatelessWidget {
  const PopReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: ListView(
      children: [
        ElevatedButton(
            onPressed: () {
              //여러개의 값을 반환하고 싶을 경우에는 List,Class 등을 사용할 수 있음.
              context.pop('thd');
            },
            child: const Text('Pop'))
      ],
    ));
  }
}
