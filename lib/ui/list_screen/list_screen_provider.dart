import 'package:flutter/material.dart';
import 'package:iti_actors/models/Actor.dart';
import 'package:iti_actors/repositories/actor-repo.dart';

class ActorsProvider extends ChangeNotifier {
  List<Actor> actors;
  ActorRepository _actorRepository = ActorRepository();

  ActorsProvider() {
    getActors();
  }

  void getActors() {
    _actorRepository.fetchActors().then((newActors) {
      actors = newActors;
      notifyListeners();
    });
  }
}
