import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_universe/data/constants.dart';
import 'package:http/http.dart' as http;

import 'RocketCard.dart';
import 'rocket_model.dart';

class Rocket extends StatefulWidget {
  @override
  _RocketState createState() => _RocketState();
}

class _RocketState extends State<Rocket> {
  final String url = 'https://api.spacexdata.com/v3/rockets';
  Future<List<Rockets>> rocket;

  Future<List<Rockets>> fetchSpaceX() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // the url is right
      final jsonList = jsonDecode(response.body); //to convert json to list
      // to make every element of list go thorugh the NAsa class and store the
      // value of the paramters in the class and is stored as object and is then
      // converted to list again
      print(jsonList);
      if (jsonList is List) {
        return jsonList.map((json) => Rockets.fromJson(json)).toList();
      }
    }
    throw Exception("Http call not made");
  }

  @override
  void initState() {
    super.initState();
    rocket = fetchSpaceX();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navigationColor,
        centerTitle: true,
        title: Text("ROCKETS"),
        titleSpacing: 3,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, Colors.pink[200]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: FutureBuilder(
            future: rocket,
            builder:
                (BuildContext context, AsyncSnapshot<List<Rockets>> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  padding: EdgeInsets.all(16),
                  children: snapshot.data
                      .map((rocket) => RocketCard(rocket: rocket))
                      .toList(),
                );
              } else {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.blueGrey[200],
                  child: Stack(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [gradientStartColor, Colors.pink[200]],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.3, 0.7])),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              SizedBox(height: 70),
                              Text(
                                "Wait a Second",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
