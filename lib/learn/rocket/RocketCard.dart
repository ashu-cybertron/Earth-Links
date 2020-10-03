import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_universe/data/constants.dart';
import 'package:image_ink_well/image_ink_well.dart';
import 'package:transparent_image/transparent_image.dart';

import 'rocket_model.dart';

class RocketCard extends StatelessWidget {
  final Rockets rocket;

  RocketCard({this.rocket});

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
                tag: rocket.flickrImages[0],
                child: RoundedRectangleImageInkWell(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RocketDetailsPage(rocket: rocket)));
                    },
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    width: 400,
                    height: 300,
                    fit: BoxFit.cover,
                    backgroundColor: Colors.transparent,
                    image: CachedNetworkImageProvider(rocket.flickrImages[0])),
              )
            ],
          ),
          Text(
            rocket.rocketName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class RocketDetailsPage extends StatelessWidget {
  final Rockets rocket;

  const RocketDetailsPage({Key key, this.rocket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(rocket.rocketName),
          backgroundColor: navigationColor),
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Container(child: Center(child: CircularProgressIndicator())),
              Hero(
                tag: rocket.flickrImages[0],
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: rocket.flickrImages[0],
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(rocket.rocketName,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal)),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              rocket.description,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
