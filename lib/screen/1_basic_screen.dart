import 'package:flutter/material.dart';
import 'package:flutter_go_router_example/layout/default_layout.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      body: Text('Basic Screen'),
    );
  }
}
