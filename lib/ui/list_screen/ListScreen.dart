import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_actors/repositories/actor-repo.dart';
import 'package:iti_actors/ui/list_screen/list_screen_provider.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ScrollController _scrollController = new ScrollController();
  int counter = 1;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          counter++;
          ActorsProvider(counter: counter);
        });
        print('hi');
        print(counter);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ActorsProvider>(
      create: (ctx) => ActorsProvider(counter: counter),
      child: Consumer<ActorsProvider>(
        builder: (buildContext, actorsProvider, _) {
          return (actorsProvider.actors != null)
              ? ListView.builder(
                  controller: _scrollController,
                  itemCount: actorsProvider.actors.length,
                  itemBuilder: (ctx, index) {
                    final actor = actorsProvider.actors[index];
                    return Card(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 12),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        height: 200,
                        child: Stack(
                          children: [
                            Container(
                              color: Colors.blue,
                              child: CachedNetworkImage(
                                fit: BoxFit.fitWidth,
                                imageUrl:
                                    'https://image.tmdb.org/t/p/w500${actor.profilePath}',
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 20,
                              right: 0,
                              child: Text(
                                '${actor.name}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator();
        },
      ),
    );
  }
}
