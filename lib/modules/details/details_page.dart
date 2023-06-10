import 'package:book_app/core/models/volume.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class DetailsPage extends StatelessWidget {
  Volume? volume;

  DetailsPage({this.volume});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(volume!.volumeInfo!.title!,style: TextStyle(color: Colors.black,fontFamily: 'Sacramento',fontSize: 30),),
        backgroundColor: Colors.white,
      ),
      body:Container(
          width:MediaQuery.of(context).size.width,
          height:  MediaQuery.of(context).size.height,

          child:SingleChildScrollView(
            child: Column(

              children:<Widget> [

                Container(
                    height: 300,
                    width: 300,
                    margin: EdgeInsets.all(10.0),
                    decoration:BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: CachedNetworkImageProvider(
                              volume!.volumeInfo!.imageLinks!.thumbnail!)
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
                ),
                Text(volume!.volumeInfo!.publishedDate!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                Text(volume!.volumeInfo!.publisher!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                Text(volume!.volumeInfo!.description!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
                volume!.volumeInfo!.infoLink != null ?
                ElevatedButton(
                  style:  ElevatedButton.styleFrom(backgroundColor: Colors.black, textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {
                    _launchUrl(Uri.parse(volume!.volumeInfo!.infoLink!));
                  },
                  child: const Text('Info link'),
                ) : Container(),
              ],
            ),
          )
      ) ,
    );
  }
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}



