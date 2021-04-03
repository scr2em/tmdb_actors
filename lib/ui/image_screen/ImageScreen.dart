import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_downloader/image_downloader.dart';

class ImageScreen extends StatefulWidget {
  final String imgPath;
  final String name;

  ImageScreen({this.imgPath, this.name});

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  void _downloadImage() async {
    try {
      var imageId = await ImageDownloader.downloadImage(
        'https://image.tmdb.org/t/p/w500${widget.imgPath}',
        destination: AndroidDestinationType.directoryDownloads
          ..subDirectory("${widget.imgPath}.gif"),
      );
      if (imageId == null) {
        return;
      }
    } on PlatformException catch (error) {
      if (error.code == "404") {
        print("Not Found Error.");
      } else if (error.code == "unsupported_file") {
        print("UnSupported FIle Error.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: ListView(
        children: [
          CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: 'https://image.tmdb.org/t/p/w500${widget.imgPath}',
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          elevation: 5.0,
          child: new Icon(Icons.file_download),
          backgroundColor: Colors.blue,
          onPressed: () {
            _downloadImage();
          }),
    );
  }
}
