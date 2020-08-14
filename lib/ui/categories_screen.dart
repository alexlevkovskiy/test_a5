import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_a5/block/categories_block.dart';
import 'package:test_a5/main.dart';
import 'package:test_a5/network/web_service.dart';
import 'package:test_a5/ui/tabs.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({Key key}) : super(key: key);
  final CategoriesBlock _categoriesBlock = CategoriesBlock();

  @override
  Widget build(BuildContext context) {
    _categoriesBlock.fetchRandomJoke();
    return StreamBuilder(
      stream: _categoriesBlock.items,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Container(
            child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      MyApp.myTabbedPageKey.currentState.tabController
                          .animateTo(2);
                    },
                    title: Text('${snapshot.data[index]}'),
                  );
                }),
          );
        }
      },
    );
  }
}
