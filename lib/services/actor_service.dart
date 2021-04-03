import 'package:iti_actors/models/Actor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActorService {
  Future<List<Actor>> fetchActors(counter) async {
    final response = await http.get(
      Uri.parse(
          ('https://api.themoviedb.org/3/person/popular?api_key=6b205e32bac82ee6cc6cc8474f60b415&page=$counter')),
    );
    if (response.statusCode == 200) {
      var results = List<Actor>.from(
          (json.decode(response.body)["results"] as List)
              .map((e) => Actor.fromJson((e)))).toList();
      return results;
    } else {
      throw Exception('FAILED TO LOAD Actors');
    }
  }
}
