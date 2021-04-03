import 'package:iti_actors/models/Actor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:async/async.dart';

class ActorService {
  Future<List<Actor>> fetchActors() async {
    final response = await http.get(
      Uri.parse(
          ('https://api.themoviedb.org/3/person/popular?api_key=6b205e32bac82ee6cc6cc8474f60b415&page=1')),
    );
    if (response.statusCode == 200) {
      return List<Actor>.from((json.decode(response.body)["results"] as List)
          .map((e) => Actor.fromJson((e)))).toList();
    } else {
      throw Exception('FAILED TO LOAD Actors');
    }
  }
}
