import 'package:flutter/material.dart';
import 'package:flutter_go_router_example/layout/default_layout.dart';

class PrivateScreen extends StatelessWidget {
  const PrivateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
        body: Center(
      child: Text('Private Screen'),
    ));
  }
}
