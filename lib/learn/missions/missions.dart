import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_universe/data/constants.dart';
import 'package:http/http.dart' as http;

import 'MissionCard.dart';
import 'mission_model.dart';

class Mission extends StatefulWidget {
  @override
  _MissionState createState() => _MissionState();
}

class _MissionState extends State<Mission> {
  final String url = 'https://api.spacexdata.com/v3/missions';
  Future<List<Missions>> mission;

  Future<List<Missions>> fetchSpaceX() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // the url is right
      final jsonList = jsonDecode(response.body); //to convert json to list
      // to make every element of list go thorugh the NAsa class and store the
      // value of the paramters in the class and is stored as object and is then
      // converted to list again
      print(jsonList);
      if (jsonList is List) {
        return jsonList.map((json) => Missions.fromJson(json)).toList();
      }
    }
    throw Exception("Http call not made");
  }

  @override
  void initState() {
    super.initState();
    mission = fetchSpaceX();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navigationColor,
        centerTitle: true,
        title: Text("MISSIONS"),
        titleSpacing: 3,
      ),
      body: Container(
        color: Colors.blueAccent[100],
        child: FutureBuilder(
            future: mission,
            builder:
                (BuildContext context, AsyncSnapshot<List<Missions>> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  padding: EdgeInsets.all(16),
                  children: snapshot.data
                      .map((mission) => MissionCard(mission: mission))
                      .toList(),
                );
              } else {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.blueAccent[100],
                  child: Stack(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
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
