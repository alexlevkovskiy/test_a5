import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_a5/network/web_service.dart';
import 'package:test_a5/ui/tabs.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({Key key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  Future<List<String>> _categories;
  @override
  void initState() {
    _categories = _getCategories();
    super.initState();
  }

  Future<List<String>> _getCategories() {
    return WebService.getCategories();
  }

  QueryProvider queryProvider;
  void _changeQuery(String query) {
    setState(() {
      queryProvider.setQuery(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    queryProvider = QueryProvider.of(context);
    return FutureBuilder(
      future: _categories,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Container(
            child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () => {_changeQuery(snapshot.data[index])},
                    title: Text('${snapshot.data[index]}'),
                  );
                }),
          );
        }
      },
    );
  }
}
