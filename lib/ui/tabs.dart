import 'package:flutter/material.dart';
import 'package:test_a5/ui/categories_screen.dart';
import 'package:test_a5/ui/random_joke_screen.dart';
import 'package:test_a5/ui/search_screen.dart';

class TabsPage extends StatefulWidget {
  TabsPage({Key key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class QueryProvider extends InheritedWidget {
  final Widget child;
  final DefaultTabController controller;
  String query;
  QueryProvider({Key key, this.child, this.controller, this.query})
      : super(key: key, child: child);

  static QueryProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<QueryProvider>());
  }

  void setQuery(String query) {
    this.query = query;
  }

  @override
  bool updateShouldNotify(QueryProvider oldWidget) {
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
          body: QueryProvider(
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
