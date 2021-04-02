import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (ctx, index) {
        return Card(
          margin: EdgeInsets.only(left: 10, right: 10, top: 12),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            child: Stack(
              children: [
                Container(
                  color: Colors.blue,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1472214103451-9374bd1c798e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8cGljfGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  right: 0,
                  child: Text(
                    'hello title',
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
    );
  }
}
