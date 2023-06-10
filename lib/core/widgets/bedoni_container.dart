import 'package:book_app/core/models/volume.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BedoniContainer extends StatelessWidget{
  Volume? volume;
  BedoniContainer({this.volume});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        width: 130,
        margin: EdgeInsets.all(10.0),
        decoration:BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: CachedNetworkImageProvider(
                  volume!.volumeInfo!.imageLinks!.smallThumbnail!)
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 4), // Shadow position
            ),
          ],
        )
    );
  }
  
  
}