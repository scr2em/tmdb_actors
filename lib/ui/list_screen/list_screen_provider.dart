import 'package:flutter/material.dart';
import 'package:iti_actors/models/Actor.dart';
import 'package:iti_actors/repositories/actor-repo.dart';

class ActorsProvider extends ChangeNotifier {
  ActorRepository _actorRepository = ActorRepository();
  ScrollController scrollController = new ScrollController();
  List<Actor> actors = [];
  int counter = 1;

  ActorsProvider() {
    if (counter == 1) {
      getActors();
    }
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          counter <= 500) {
        counter++;
        getActors();
      }
    });
  }

  void getActors() {
    _actorRepository.fetchActors(this.counter).then((newActors) {
      actors.addAll(newActors);
      notifyListeners();
    });
  }
}
