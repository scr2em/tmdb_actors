import 'package:flutter/material.dart';
import 'package:iti_actors/models/Actor.dart';
import 'package:iti_actors/repositories/actor-repo.dart';

class ActorsProvider extends ChangeNotifier {
  ActorRepository _actorRepository = ActorRepository();
  List<Actor> actors = [];
  int counter = 1;

  ActorsProvider() {
    getActors();
  }

  void getActors() {
    _actorRepository.fetchActors(this.counter).then((newActors) {
      counter++;
      actors.addAll(newActors);
      notifyListeners();
    });
  }
}
