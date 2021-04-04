import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iti_actors/ui/detail_screen/detail_screen_provider.dart';
import 'package:iti_actors/ui/image_screen/ImageScreen.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

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
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      actorProvider.actor.imagesProfiles != null
                          ? Container(
                              color: Colors.blueGrey[900],
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text('${actorProvider.actor.name}',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                          'Birthday: ${actorProvider.actor.birthDate}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Birth Place: ${actorProvider.actor.birthPlace}',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
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
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          'Biography: ${actorProvider.actor.biography}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white)),
                                    ),
                                    GridView.count(
                                      physics:
                                          NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                                      shrinkWrap: true,
                                      crossAxisCount: 2,
                                      childAspectRatio: 8.0 / 9.0,
                                      children: actorProvider
                                          .actor.imagesProfiles
                                          .map<Widget>(
                                            (i) => Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ImageScreen(
                                                              name:
                                                                  actorProvider
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
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Text(''),
                    ],
                  )
                : CircularProgressIndicator();
          });
        },
      ),
    );
  }
}
