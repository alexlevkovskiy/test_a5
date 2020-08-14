import 'package:test_a5/network/models/random_joke.dart';
import 'package:test_a5/network/web_service.dart';
import 'base_block.dart';
import 'package:rxdart/rxdart.dart';

class CategoriesBlock extends BaseBloc {
  Stream<List<String>> get items => _itemsSubject.stream;

  final _itemsSubject = BehaviorSubject<List<String>>();
  fetchRandomJoke() async {
    List<String> responce = await WebService.getCategories();
    _itemsSubject.add(responce);
  }

  @override
  dispose() {
    _itemsSubject.close();
  }
}

CategoriesBlock justDataBloc = CategoriesBlock();
