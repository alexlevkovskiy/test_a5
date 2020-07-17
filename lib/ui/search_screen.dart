import 'package:flutter/material.dart';
import 'package:test_a5/network/models/search.dart';
import 'package:test_a5/network/web_service.dart';
import 'package:test_a5/ui/tabs.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<List<Result>> _searchFuture;
  String query = '';
  _SearchPageState();
  @override
  void initState() {
    _searchFuture = _search(query);
    super.initState();
  }

  Future<List<Result>> _search(String query) {
    return WebService.search(query);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    CountProvider data = CountProvider.of(context);
    query = data.query;
    _searchFuture = _search(query);
    editingController.text = query;
    checkIsValid(query);
  }

  void checkIsValid(String newQuery) {
    setState(() {
      if (newQuery.length > 2 && newQuery.length < 120)
        _isValid = true;
      else
        _isValid = false;
    });
  }

  TextEditingController editingController = TextEditingController();

  bool _isValid = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              checkIsValid(value);
            },
            controller: editingController,
            decoration: InputDecoration(
              labelText: "Search",
              hintText: "Search",
              errorText: !_isValid
                  ? 'Search query must be from 3 to 120 symbols'
                  : null,
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder(
              future: _searchFuture,
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  if (!_isValid)
                    return Container(
                      child: Text('Search query must be from 3 to 120 symbols'),
                    );
                  return Container(
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text('${snapshot.data[index].value}'),
                          );
                        }),
                  );
                }
              }),
        ),
      ],
    );
  }
}
