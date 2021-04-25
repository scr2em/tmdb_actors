import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_actors/models/Actor.dart';
import 'package:iti_actors/ui/detail_screen/DetailScreen.dart';
import 'package:iti_actors/ui/list_screen/list_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ActorsProvider>(
      create: (context) => ActorsProvider(),
      child: Consumer<ActorsProvider>(
        builder: (buildContext, actorProvider, _) {
          return (actorProvider.actors.isNotEmpty)
              ? ListView.builder(
                  controller: actorProvider.scrollController,
                  itemCount: actorProvider.actors.length,
                  itemBuilder: (ctx, index) {
                    final Actor actor = actorProvider.actors[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(
                                title: Text(actor.name),
                              ),
                              body: DetailScreen(index: index, actor: actor),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 150,
                        child: Card(
                          color: Colors.blueGrey[50],
                          margin: EdgeInsets.only(left: 10, right: 10, top: 12),
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      'https://image.tmdb.org/t/p/w500${actor.profilePath}',
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        '${actor.name}',
                                        style: TextStyle(
                                          color: Colors.blue[800],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Text(
                                      'Department: ${actor.department}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    actor.popularity != null
                                        ? SmoothStarRating(
                                            allowHalfRating: true,
                                            onRated: (v) {},
                                            starCount: 10,
                                            rating: actor.popularity,
                                            size: 15,
                                            isReadOnly: true,
                                            filledIconData: Icons.star_rate,
                                            halfFilledIconData: Icons.star_half,
                                            color: Colors.orangeAccent,
                                            borderColor: Colors.black,
                                            spacing: 0.0)
                                        : Text('')
                                  ],
                                ),
                                flex: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
