import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final index;
  final actor;

  DetailScreen({this.index, this.actor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: 'https://image.tmdb.org/t/p/w500${actor.profilePath}',
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
