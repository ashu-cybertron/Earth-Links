import 'dart:convert';

import 'package:flutter_universe/data/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../maps/iss.dart';

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  final String url = 'http://api.open-notify.org/astros.json';
  final String url1 = 'http://api.open-notify.org/iss-now.json';

  List<dynamic> data;
  int data1;
  double lat;
  double lon;
  String s;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
    this.getJsonData1();
  }

  Future getJsonData() async {
    var response = await http.get(
        //Encode the url and no spaces
        Uri.encodeFull(url),
        // only accept json response
        headers: {'Accept': 'application/json'});
    print(response.body);

    setState(() {
      //var convertDataToString = json.encode(response.body);
      //var convertDataToJson = JsonEncoder().convert(response.body);
      Map<String, dynamic> jsonInput = jsonDecode(response.body);
      data = jsonInput['people'];
      data1 = jsonInput['number'];
    });
    //return "Sucess";
  }

  Future getJsonData1() async {
    var response = await http.get(
        //Encode the url and no spaces
        Uri.encodeFull(url1),
        // only accept json response
        headers: {'Accept': 'application/json'});
    //print(response.body);

    setState(() {
      //var convertDataToString = json.encode(response.body);
      //var convertDataToJson = JsonEncoder().convert(response.body);
      Map<String, dynamic> jsonInput = jsonDecode(response.body);

      lat = double.parse(jsonInput['iss_position']['latitude']);
      lon = double.parse(jsonInput['iss_position']['longitude']);
    });
    //return "Sucess";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navigationColor,
        title: Center(
          child: Text(
            "Satellites",
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                getJsonData();
                getJsonData1();
              })
        ],
      ),
      body: data == null
          ? Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new CircularProgressIndicator(),
                    SizedBox(height: 30),
                    new Text("Loading"),
                  ],
                ),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sattelite Name : ${data[1]['craft']}',
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Number of Astronauts present currently : $data1')
                    ],
                  ),
                )),
                Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: data == null ? 0 : data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Card(
                                  child: Container(
                                      child: Text(data[index]["name"]),
                                      padding: EdgeInsets.all(20))),
                            ],
                          ),
                        ));
                      }),
                ),
                Container(
                  //color: Colors.black,
                  height: 200,
                  child: Column(
                    children: [
                      Text('Latitude : $lat'),
                      Text('Longitude : $lon')
                    ],
                  ),
                ),
                Container(
                    child: IconButton(
                        icon: Icon(Icons.navigate_next),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IssMap(
                                        latitude: lat,
                                        longitude: lon,
                                      )));
                        }))
              ],
            ),
    );
  }
}
