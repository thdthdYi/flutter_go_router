import 'package:flutter/material.dart';
import 'package:flutter_go_router_example/route/router.dart';
// ignore: unused_import
import 'package:flutter_go_router_example/screen/root_screen.dart';

// ignore: unused_import
import 'layout/default_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //router를 사용하기 위한 설정
      routerConfig: router,
    );
  }
}
