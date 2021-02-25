import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class photoview extends StatefulWidget {
  String ImageUrl;

  photoview({this.ImageUrl});

  @override
  _photoviewState createState() => _photoviewState();
}

class _photoviewState extends State<photoview> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoView(
          imageProvider: CachedNetworkImageProvider("${widget.ImageUrl}"),
        )
    );
  }
}
