import 'package:connectivity/connectivity.dart';
import 'package:iti_actors/local_storage/db_helper.dart';
import 'package:iti_actors/models/Actor.dart';
import 'package:iti_actors/models/ActorDetails.dart';
import 'package:iti_actors/services/actor_service.dart';

class ActorRepository {
  ActorService _actorService = ActorService();

  Future<List<Actor>> fetchActors(counter) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    final DbHelper dbHelper = DbHelper.instance;
    if (connectivityResult == ConnectivityResult.none) {
      List<Map<String, dynamic>> dbActorsMap = await dbHelper.queryAllRows();
      List<Actor> dbActors =
          dbActorsMap.map((e) => Actor.fromDatabase(e)).toList();
      return dbActors;
    } else {
      final netActors = await _actorService.fetchActors(counter);
      for (final actor in netActors) {
        dbHelper.insert(actor.toMap());
      }
      return netActors;
    }
  }

  Future<ActorDetail> fetchActor(id, index) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    final dbHelper = DbHelper.instance;
    if (connectivityResult == ConnectivityResult.none) {
      List<Map<String, dynamic>> dbActorsMap = await dbHelper.queryAllRows();
      final Map<String, dynamic> dbActorMap = dbActorsMap.firstWhere((element) {
        return element[DbHelper.COLUMN_ID] == id;
      });
      ActorDetail dbActor = ActorDetail.fromDatabase(dbActorMap);
      return dbActor;
    } else {
      final ActorDetail netActor = await _actorService.fetchActor(id);
      dbHelper.insert(netActor.toMap());
      return netActor;
    }
  }
}
