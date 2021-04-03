import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iti_actors/ui/detail_screen/detail_screen_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final index;
  final actor;

  DetailScreen({this.index, this.actor});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ActorProvider>(
      create: (ctx) => ActorProvider(actor.id),
      child: Consumer<ActorProvider>(
        builder: (buildCtx, actorProvider, _) {
          return actorProvider.actor != null
              ? ListView(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          'https://image.tmdb.org/t/p/w500${actor.profilePath}',
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Text('${actorProvider.actor.name}'),
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${actorProvider.actor.modifiedImages[2].imgPath}',
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ])
              : CircularProgressIndicator();
        },
      ),
    );
  }
}
