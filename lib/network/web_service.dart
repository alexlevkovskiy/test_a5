import 'dart:convert';

import 'package:test_a5/network/models/random_joke.dart';
import 'package:http/http.dart' as http;
import 'package:test_a5/network/models/search.dart';

class WebService {
  static final _baseUrl =
      'https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/';

  static final Map<String, String> header = {
    'x-rapidapi-key': '5EhUQzcfpXmshxr3QRgedbG7vEEwp1rgXz2jsnePxk70G1no2O'
  };
  static String _categories() {
    return '$_baseUrl' + 'categories';
  }

  static String _search(String query) {
    return '$_baseUrl' + 'search' + '?query=$query';
  }

  static String _random() {
    return '$_baseUrl' + 'random';
  }

  static Future<RandomJoke> getRandomJokes() async {
    http.Response response =
        await http.get(Uri.encodeFull(_random()), headers: header);
    if (response.statusCode == 200)
      return RandomJoke.fromJson(json.decode(response.body));
    else
      throw Exception('Failed');
  }

  static Future<List<String>> getCategories() async {
    http.Response response =
        await http.get(Uri.encodeFull(_categories()), headers: header);
    List body = json.decode(response.body);
    List<String> categories = List.from(body);

    return categories;
  }

  static Future<List<Result>> search(String query) async {
    http.Response response =
        await http.get(Uri.encodeFull(_search(query)), headers: header);
    print(response.body);
    Map responseMap = json.decode(response.body);
    Search search = Search.fromJson(responseMap);
    return search.result;
  }
}
