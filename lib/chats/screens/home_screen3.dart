import 'package:flutter/material.dart';
import 'package:flutter_universe/chats/widget/Chats.dart';
import 'package:flutter_universe/data/constants.dart';

class HomeScreen3 extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientStartColor, //to see curves
      appBar: AppBar(
        backgroundColor: gradientStartColor,
        title: Center(
          child: Text("Discussions",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              )),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {})
        ],
      ),
      body: Column(
        children: [
          //CategorySelector(),
          Expanded(
            //to force container to take the whole area of the app
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: <Widget>[
                    // SizedBox(height: 50),
                    //FavouriteContacts(),
                    RecentChats(),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
