import 'package:flutter/material.dart';
import 'package:test_a5/ui/search_screen.dart';
import 'package:test_a5/ui/tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static var routes = <String, WidgetBuilder>{
    '/search': (BuildContext context) => new SearchPage(),
  };

  static Route<BuildContext> _getRoute(RouteSettings settings) {
    var builder = routes[settings.name];
    if (builder != null) {
      return new MaterialPageRoute(
        settings: settings,
        builder: builder,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: TabsPage(),
      onGenerateRoute: _getRoute,
    );
  }
}
