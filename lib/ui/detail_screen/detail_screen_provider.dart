import 'package:flutter/material.dart';
import 'package:iti_actors/models/ActorDetails.dart';
import 'package:iti_actors/repositories/actor-repo.dart';

class ActorProvider extends ChangeNotifier {
  ActorRepository _actorRepository = ActorRepository();
  ActorDetail actor;

  ActorProvider(id, index) {
    getActor(id, index);
  }

  void getActor(id, index) {
    _actorRepository.fetchActor(id, index).then((newActor) {
      actor = newActor;
      notifyListeners();
    });
  }
}
