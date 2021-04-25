import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iti_actors/models/Actor.dart';
import 'package:iti_actors/ui/detail_screen/detail_screen_provider.dart';
import 'package:iti_actors/ui/image_screen/ImageScreen.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetailScreen extends StatelessWidget {
  final int index;
  final Actor actor;

  DetailScreen({this.index, this.actor});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ActorProvider>(
      create: (ctx) => ActorProvider(actor.id, index),
      child: Consumer<ActorProvider>(
        builder: (buildCtx, actorProvider, _) {
          return LayoutBuilder(builder: (buildCtx, constraints) {
            return actorProvider.actor != null
                ? ListView(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CachedNetworkImage(
                          height: constraints.maxHeight,
                          fit: BoxFit.cover,
                          imageUrl:
                              'https://image.tmdb.org/t/p/w500${actor.profilePath}',
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      actorProvider.actor.birthDate != null
                          ? Container(
                              color: Colors.blueGrey[900],
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Text('${actorProvider.actor.name}',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                          'Birthday: ${actorProvider.actor.birthDate}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Birth Place: ${actorProvider.actor.birthPlace}',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: SmoothStarRating(
                                          allowHalfRating: true,
                                          onRated: (v) {},
                                          starCount: 10,
                                          rating: actor.popularity,
                                          size: 23,
                                          isReadOnly: true,
                                          filledIconData: Icons.star_rate,
                                          halfFilledIconData: Icons.star_half,
                                          color: Colors.orangeAccent,
                                          borderColor: Colors.black,
                                          spacing: 0.0),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                          'Biography: ${actorProvider.actor.biography}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white)),
                                    ),
                                    actorProvider.actor.imagesProfiles != null
                                        ? GridView.count(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            crossAxisCount: 2,
                                            childAspectRatio: 8.0 / 9.0,
                                            children: actorProvider
                                                .actor.imagesProfiles
                                                .map<Widget>(
                                                  (i) => Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .push(
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                ImageScreen(
                                                                    name: actorProvider
                                                                        .actor
                                                                        .name,
                                                                    imgPath: i[
                                                                        'file_path']),
                                                          ),
                                                        );
                                                      },
                                                      child: CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl:
                                                            'https://image.tmdb.org/t/p/w500${i['file_path']}',
                                                        placeholder: (context,
                                                                url) =>
                                                            CircularProgressIndicator(),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          )
                                        : Text('')
                                  ],
                                ),
                              ),
                            )
                          : Text(''),
                    ],
                  )
                : Center(child: CircularProgressIndicator());
          });
        },
      ),
    );
  }
}
