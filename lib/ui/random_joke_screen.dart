import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:test_a5/network/models/random_joke.dart';
import 'package:test_a5/network/web_service.dart';

class RandomJokePage extends StatefulWidget {
  RandomJokePage({Key key}) : super(key: key);

  @override
  _RandomJokePageState createState() => _RandomJokePageState();
}

class _RandomJokePageState extends State<RandomJokePage> {
  Future<RandomJoke> _jokes;
  @override
  void initState() {
    super.initState();
    _jokes = _getRandomJokes();
  }

  Future<RandomJoke> _getRandomJokes() {
    return WebService.getRandomJokes();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<RandomJoke>(
          future: _jokes,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                return jokeTextView(snapshot.data.value);
              } else if (snapshot.hasError) {
                return jokeTextView("${snapshot.error}");
              } else {
                return jokeTextView('');
              }
            }
          },
        ),
        RaisedButton(
            onPressed: () => setState(() {
                  _jokes = _getRandomJokes();
                }),
            color: Colors.purple,
            child: Text('Refresh'))
      ],
    );
  }

  Widget jokeTextView(String text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          text,
          style: TextStyle(),
        ),
      ),
    );
  }
}
