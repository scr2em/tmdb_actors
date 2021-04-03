import 'package:iti_actors/models/Actor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:iti_actors/models/ActorDetails.dart';

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

  Future<ActorDetail> fetchActor(id) async {
    final response = await http.get(
      Uri.parse(
          ('https://api.themoviedb.org/3/person/$id?api_key=6b205e32bac82ee6cc6cc8474f60b415&append_to_response=images')),
    );
    if (response.statusCode == 200) {
      var result = ActorDetail.fromJson(json.decode(response.body));
      var images = List<Image>.from(
          (json.decode(response.body)['images']['profiles'] as List)
              .map((e) => Image.fromJson((e)))).toList();
      result.modifiedImages = images;
      return result;
    } else {
      throw Exception('FAILED TO LOAD Actors');
    }
  }
}
