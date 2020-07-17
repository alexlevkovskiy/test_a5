import 'package:flutter/material.dart';
import 'package:test_a5/ui/categories_screen.dart';
import 'package:test_a5/ui/random_joke_screen.dart';
import 'package:test_a5/ui/search_screen.dart';

class TabsPage extends StatefulWidget {
  TabsPage({Key key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class CountProvider extends InheritedWidget {
  final Widget child;
  final DefaultTabController controller;
  String query;
  CountProvider({Key key, this.child, this.controller, this.query})
      : super(key: key, child: child);

  static CountProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CountProvider)
        as CountProvider);
  }

  void setQuery(String query) {
    this.query = query;
  }

  @override
  bool updateShouldNotify(CountProvider oldWidget) {
    return true;
  }
}

class _TabsPageState extends State<TabsPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tabs Example'),
            bottom: TabBar(tabs: [
              Tab(
                text: "Random",
              ),
              Tab(
                text: "Categories",
              ),
              Tab(
                text: 'Search',
              ),
            ]),
          ),
          body: CountProvider(
            query: '',
            child: TabBarView(children: [
              RandomJokePage(),
              CategoriesPage(),
              SearchPage(),
            ]),
          ),
        ),
      ),
    );
  }
}
