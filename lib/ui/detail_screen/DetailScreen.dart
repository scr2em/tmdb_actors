import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iti_actors/ui/detail_screen/detail_screen_provider.dart';
import 'package:iti_actors/ui/image_screen/ImageScreen.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final index;
  final actor;

  DetailScreen({this.index, this.actor});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ActorProvider>(
      create: (ctx) => ActorProvider(actor.id, index),
      child: Consumer<ActorProvider>(
        builder: (buildCtx, actorProvider, _) {
          return actorProvider.actor != null
              ? ListView(
                  children: [
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
                    Text('${actorProvider.actor.name}',
                        style: TextStyle(fontSize: 20)),
                    Text('Birthday: ${actorProvider.actor.birthDate}',
                        style: TextStyle(fontSize: 20)),
                    Text('Birth Place: ${actorProvider.actor.birthPlace}',
                        style: TextStyle(fontSize: 20)),
                    Text(
                      'Biography: ${actorProvider.actor.biography}',
                    ),
                    actorProvider.actor.modifiedImages != null
                        ? GridView.count(
                            physics:
                                NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            padding: EdgeInsets.all(4.0),
                            childAspectRatio: 8.0 / 9.0,
                            children: actorProvider.actor.modifiedImages
                                .map(
                                  (i) => GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => ImageScreen(
                                              name: actorProvider.actor.name,
                                              imgPath: i.imgPath),
                                        ),
                                      );
                                    },
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          'https://image.tmdb.org/t/p/w500${i.imgPath}',
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                )
                                .toList())
                        : Text("No Images to Load"),
                  ],
                )
              : CircularProgressIndicator();
        },
      ),
    );
  }
}
