import 'package:flutter/material.dart';
import 'package:flutter_universe/data/constants.dart';
import 'package:transparent_image/transparent_image.dart';

import 'model.dart';

class DetailsPage extends StatelessWidget {
  final Nasa nasa;

  const DetailsPage({Key key, this.nasa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nasa.title), backgroundColor: navigationColor),
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Container(child: Center(child: CircularProgressIndicator())),
              Hero(
                tag: nasa.url,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: nasa.url,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(nasa.date,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.normal)),
                Container(
                  width: 200,
                  child: Text("© ${nasa.copyright}",
                      softWrap: true,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal)),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              nasa.description,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
