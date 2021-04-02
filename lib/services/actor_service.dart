import 'package:iti_actors/models/Actor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ActorService {
  Future<List<Actor>> fetchActors() async {
    final response = await http.get(
      Uri.parse(
          ('https://api.themoviedb.org/3/person/popular?api_key=6b205e32bac82ee6cc6cc8474f60b415&page=1')),
    );
    final results = json.decode(response.body)["results"];
    final List<Actor> actors =
        results.map((Map<String, dynamic> e) => Actor.fromJson(e)).toList();
    return actors;
  }
}
