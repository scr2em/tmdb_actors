import 'package:iti_actors/models/Actor.dart';
import 'package:iti_actors/services/actor_service.dart';

class ActorRepository {
  ActorService _actorService = ActorService();
  Future<List<Actor>> fetchActors() async {
    final actors = await _actorService.fetchActors();
    return actors;
  }
}
