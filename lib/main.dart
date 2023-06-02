import 'package:flutter/material.dart';

import 'layout/default_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Container(),
    );
  }
}
