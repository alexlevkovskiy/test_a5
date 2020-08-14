import 'package:test_a5/network/models/random_joke.dart';
import 'package:test_a5/network/web_service.dart';
import 'base_block.dart';
import 'package:rxdart/rxdart.dart';

class RandomBlock extends BaseBloc {
  Stream<RandomJoke> get items => _itemsSubject.stream;

  final _itemsSubject = BehaviorSubject<RandomJoke>();
  fetchRandomJoke() async {
    RandomJoke responce = await WebService.getRandomJokes();
    _itemsSubject.add(responce);
  }

  @override
  dispose() {
    _itemsSubject.close();
  }
}

RandomBlock justDataBloc = RandomBlock();
