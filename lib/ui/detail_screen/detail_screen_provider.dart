import 'package:flutter/material.dart';
import 'package:iti_actors/models/ActorDetails.dart';
import 'package:iti_actors/repositories/actor-repo.dart';

class ActorProvider extends ChangeNotifier {
  ActorRepository _actorRepository = ActorRepository();
  ActorDetail actor;

  ActorProvider(id) {
    getActor(id);
  }

  void getActor(id) {
    _actorRepository.fetchActor(id).then((newActor) {
      actor = newActor;
      notifyListeners();
    });
  }
}
