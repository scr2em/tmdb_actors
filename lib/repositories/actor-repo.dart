import 'package:iti_actors/models/Actor.dart';
import 'package:iti_actors/services/actor_service.dart';

class ActorRepository {
  ActorService _actorService = ActorService();
  Future<List<Actor>> fetchActors(counter) async {
    final actors = await _actorService.fetchActors(counter);
    print('repo $counter');
    return actors;
  }
}
