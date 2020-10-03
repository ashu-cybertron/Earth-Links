import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:image_ink_well/image_ink_well.dart';

import 'details.dart';
import 'model.dart';

class NasaCard extends StatelessWidget {
  final Nasa nasa;

  NasaCard({this.nasa});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 16,
      margin: EdgeInsets.all(12),
      color: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  height: 150,
                  //color: Colors.black,
                  child: FlareActor(
                    "assets/loading.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: "Load",
                  ),
                ),
              ),
              Hero(
                tag: nasa.url,
                child: RoundedRectangleImageInkWell(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage(nasa: nasa)));
                    },
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    width: 400,
                    height: 300,
                    fit: BoxFit.cover,
                    backgroundColor: Colors.transparent,
                    image: CachedNetworkImageProvider(nasa.url)),
              )
            ],
          ),
          Text(
            nasa.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
