import 'package:flutter/material.dart';
import 'package:test_a5/ui/categories_screen.dart';
import 'package:test_a5/ui/random_joke_screen.dart';
import 'package:test_a5/ui/search_screen.dart';

class TabsPage extends StatefulWidget {
  TabsPage({Key key}) : super(key: key);

  @override
  TabsPageState createState() => TabsPageState();
}

class TabsPageState extends State<TabsPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs Example'),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              text: "Random",
            ),
            Tab(
              text: "Categories",
            ),
            Tab(
              text: 'Search',
            ),
          ],
        ),
      ),
      body: QueryProvider(
        query: '',
        child: TabBarView(
          children: [
            RandomJokePage(),
            CategoriesPage(),
            SearchPage(),
          ],
          controller: tabController,
        ),
      ),
    );
  }
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
