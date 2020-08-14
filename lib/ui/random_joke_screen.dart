import 'package:flutter/material.dart';
import 'package:test_a5/block/random_block.dart';
import 'package:test_a5/network/models/random_joke.dart';

class RandomJokePage extends StatelessWidget {
  RandomJokePage({Key key}) : super(key: key);

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

  final RandomBlock randomBlock = RandomBlock();
  @override
  Widget build(BuildContext context) {
    randomBlock.fetchRandomJoke();
    return Column(
      children: [
        StreamBuilder<RandomJoke>(
          stream: randomBlock.items,
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
            onPressed: () {
              randomBlock.fetchRandomJoke();
            },
            color: Colors.purple,
            child: Text('Refresh'))
      ],
    );
  }
}
