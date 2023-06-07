import 'package:flutter/material.dart';
import 'package:flutter_go_router_example/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class QueryParameterScreen extends StatelessWidget {
  const QueryParameterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: ListView(
      children: [
        //값을 가져오기
        Text('Query Parameter : ${GoRouterState.of(context).queryParameters}'),
        //query_parameter?name=thd&age=32
        ElevatedButton(
            onPressed: () {
              context.push(
                Uri(path: '/query_param', queryParameters: {
                  'name': 'thd',
                  'age': '32',
                }).toString(),
              );
            },
            child: const Text('Query Parameter'))
      ],
    ));
  }
}
