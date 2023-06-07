import 'package:flutter/material.dart';
import 'package:flutter_go_router_example/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class PopBaseScreen extends StatelessWidget {
  const PopBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: ListView(
      children: [
        ElevatedButton(
            //언제 pop할지 모르므로
            onPressed: () async {
              final result = await context.push('/pop/return');

              print(result);
            },
            child: const Text('Pop Base Screen'))
      ],
    ));
  }
}
