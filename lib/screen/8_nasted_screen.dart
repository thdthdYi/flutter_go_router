import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NestedScreen extends StatelessWidget {
  final Widget child;
  const NestedScreen({required this.child, Key? key}) : super(key: key);

//현재 인덱스
  int getIndex(BuildContext context) {
    if (GoRouter.of(context).location == '/nested/a') {
      print(GoRouter.of(context).location);
      return 0;
    } else if (GoRouter.of(context).location == '/nested/b') {
      print(GoRouter.of(context).location);
      return 1;
    } else {
      print(GoRouter.of(context).location);
      return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${GoRouter.of(context).location}'),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: getIndex(context),
          onTap: (index) {
            //문제 해결 > 주소 앞에 /를 안붙일 경우 mapping이 제대로 이루어지지 않는다.
            //주소 확인을 꼭 할 것.
            if (index == 0) {
              context.go('/nested/a');
              print(index);
            } else if (index == 1) {
              print(index);
              context.go('/nested/b');
            } else {
              print(index);
              context.go('/nested/c');
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'person'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'notifications'),
          ]),
    );
  }
}
