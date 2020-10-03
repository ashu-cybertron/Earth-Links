import 'package:flutter/material.dart';
import 'package:flutter_universe/data/constants.dart';
import 'package:flutter_universe/learn/missions/missions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'rocket/Rocket.dart';
import 'upcoming_launch/uplaunch.dart';

class HomeLearn extends StatelessWidget {
  Items item1 = new Items(
    title: "Rockets",
    subtitle: "ROckets used by spacex",
    tag: 0,
    img: "assets/rocket.png",
  );

  Items item2 = new Items(
    title: "Missions",
    subtitle: "see diff Missions of spacex",
    tag: 1,
    img: "assets/mission.jpg",
  );
  Items item3 = new Items(
    title: "History",
    subtitle: "Read history of spacex",
    img: "assets/history.png",
    tag: 2,
  );
  Items item4 = new Items(
    title: "Launches",
    subtitle: "Read about upcoming launches",
    img: "assets/upcoming.jpg",
    tag: 3,
  );
  var color = 0xff453658;

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    return Container(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: navigationColor,
            title: Text(
              "WHAT U WANT TO LEARN",
              //style: TextStyle(letterSpacing: 3),
            )),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: GridView.count(
                  childAspectRatio: 0.8,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  children: myList.map((data) {
                    return InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(color),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              data.img,
                              width: 60,
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Text(
                              data.title,
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              data.subtitle,
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: Colors.white38,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        if (data.tag == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Rocket()));
                        } else if (data.tag == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Mission()));
                        } else if (data.tag == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Uplaunch1()));
                        }
                      },
                    );
                  }).toList()),
            ),
          ],
        ),
      ),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  int tag;
  Items({this.title, this.subtitle, this.event, this.img, this.tag});
}
