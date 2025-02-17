import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

class ImageScreen extends StatelessWidget {
  final String imgPath;
  final String name;

  ImageScreen({this.imgPath, this.name});

  void _downloadImage() async {
    try {
      var imageId = await ImageDownloader.downloadImage(
        'https://image.tmdb.org/t/p/w500$imgPath',
        destination: AndroidDestinationType.directoryDownloads
          ..subDirectory("$imgPath"),
      );
      if (imageId == null) {
        return;
      }
    } on PlatformException catch (error) {
      if (error.code == "404") {
        print("Error, Image is not found.");
      } else if (error.code == "Unsupported file.") {
        print("Unsupported file error.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: LayoutBuilder(builder: (buildCtx, constraints) {
        return ListView(
          children: [
            CachedNetworkImage(
              height: constraints.maxHeight,
              fit: BoxFit.cover,
              imageUrl: 'https://image.tmdb.org/t/p/w500$imgPath',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
          elevation: 5.0,
          child: Icon(Icons.file_download),
          backgroundColor: Colors.blue,
          onPressed: () {
            _downloadImage();
          }),
    );
  }
}
