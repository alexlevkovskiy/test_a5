import 'package:flutter/material.dart';
import 'package:test_a5/ui/tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final myTabbedPageKey = new GlobalKey<TabsPageState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: TabsPage(
        key: myTabbedPageKey,
      ),
    );
  }
}
