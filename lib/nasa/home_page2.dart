import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_universe/chats/screens/home_screen3.dart';
import 'package:flutter_universe/data/constants.dart';
import 'package:flutter_universe/drawer/drawer.dart';
import 'package:flutter_universe/search/search.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'error.dart';
import 'model.dart';
import 'nasa_card.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  Future<List<Nasa>> nasa; //varible to store list of data got from api s
  final String url = "https://apodapi.herokuapp.com/api/?count=10";

  //method to fetch the data from url
  Future<List<Nasa>> fetchNasa() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // the url is right
      final jsonList = jsonDecode(response.body); //to convert json to list
      // to make every element of list go thorugh the NAsa class and store the
      // value of the paramters in the class and is stored as object and is then
      // converted to list again
      print(jsonList);
      if (jsonList is List) {
        return jsonList.map((json) => Nasa.fromJson(json)).toList();
      }
    }
    throw Exception("Http call not made");
  }

  @override
  void initState() {
    super.initState();
    nasa = fetchNasa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: navigationColor,
        title: Text("News",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.autorenew),
              onPressed: () {
                setState(() {
                  nasa = fetchNasa();
                });
              })
        ],
      ),
      // used to wait for the future ,when we will get deta from cloud
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, Colors.pink[200]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: FutureBuilder(
            future: nasa,
            builder:
                (BuildContext context, AsyncSnapshot<List<Nasa>> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  padding: EdgeInsets.all(16),
                  children: snapshot.data
                      .map((nasa) => NasaCard(nasa: nasa))
                      .toList(),
                );
              } else if (snapshot.hasError) {
                return Error(error: snapshot.error);
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
                        //height: MediaQuery.of(context).size.height,
                        //width: MediaQuery.of(context).size.width,
                        //color: Colors.black,
                        child: FlareActor(
                          "assets/spaceman.flr",
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          animation: "Untitled",
                        ),
                      ),
                      //Center(
                      //child:
                      Align(
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
                      //),
                      //SizedBox(height: 30),
                      // CircularProgressIndicator(
                      //   valueColor: AlwaysStoppedAnimation(
                      //     Colors.white,
                      //   ),
                      // )
                    ],
                  ),
                );
              }
            }),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        //elevation : 0,
        color: navigationColor,
        backgroundColor: Colors.pink[200],
        buttonBackgroundColor: Colors.white,
        height: 50,
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        index: 3, //to select default icon
        items: <Widget>[
          IconButton(
            icon: Image.asset('assets/profile_icon.png'),
            color: Colors.white,
            iconSize: 20,
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/menu_icon.png'),
            color: Colors.white,
            iconSize: 20,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DrawerPage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            iconSize: 20,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReadHistory()));
            },
          ),
          IconButton(
            //icon: Image.asset('assets/newspaper.png',
            //  color: Colors.white),
            icon: Icon(Icons.calendar_today),
            color: Colors.black,
            iconSize: 20,
            onPressed: () {},
          ),
        ],
        onTap: (index) {
          debugPrint("Current Index is $index");
          if (index == 1) {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => SimpleScatterPlotChart()));
          }
        },
      ),
    );
  }
}
