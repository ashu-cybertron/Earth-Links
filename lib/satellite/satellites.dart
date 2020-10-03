import 'package:flutter/material.dart';
import 'package:flutter_universe/data/constants.dart';
import 'package:flutter_universe/satellite/tracker/tracker.dart';
import 'package:image_ink_well/image_ink_well.dart';

class Satellite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: navigationColor,
        title: Center(child: Text("SATELLITES")),
        titleSpacing: 3,
        actions: [Icon(Icons.place)],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Card(
                    elevation: 16,
                    margin: EdgeInsets.all(12.0),
                    color: Colors.lightBlue[50],
                    shape: RoundedRectangleBorder(
                      //side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedRectangleImageInkWell(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)),
                          height: 300,
                          width: 400,
                          image: AssetImage("assets/satiss.jpg"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Tracker()));
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: "Name : ",
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: "ISS",
                                        style: TextStyle(
                                            color: Colors.red,
                                            letterSpacing: 3),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
