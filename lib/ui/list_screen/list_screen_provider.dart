import 'package:flutter/material.dart';
import 'package:iti_actors/models/Actor.dart';
import 'package:iti_actors/repositories/actor-repo.dart';

class ActorsProvider extends ChangeNotifier {
  List<Actor> actors;
  int counter;

  ActorRepository _actorRepository = ActorRepository();

  ActorsProvider({this.counter}) {
    getActors(this.counter);
    print('this counter ${this.counter}');
    print('soso');
  }

  void getActors(counter) {
    _actorRepository.fetchActors(counter).then((newActors) {
      actors = newActors;
      print('$actors');
      notifyListeners();
    });
  }
}
