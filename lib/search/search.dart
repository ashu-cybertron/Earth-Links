import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_universe/chats/screens/home_screen3.dart';
import 'package:flutter_universe/data/constants.dart';
import 'package:flutter_universe/drawer/drawer.dart';
import 'package:flutter_universe/nasa/home_page2.dart';
import 'data.dart';

class ReadHistory extends StatefulWidget {
  @override
  _ReadHistoryState createState() => new _ReadHistoryState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _ReadHistoryState extends State<ReadHistory> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      appBar: AppBar(
        backgroundColor: navigationColor,
        title: Center(
          child: Text("History",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Calibre-Semihold',
                letterSpacing: 3.0,
              )),
        ),
        actions: [
          Icon(Icons.search, size: 30.0, color: Colors.white),
        ],
      ),
      body:
          //helps u too scroll in app
          SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          //width=MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [gradientStartColor, gradientEndColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 0.7])),
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFF6e6e),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 22.0, vertical: 6.0),
                            child: Text("A Century ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text("25 + Stories", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage),
                  Positioned.fill(
                      child: PageView.builder(
                    itemCount: images.length,
                    controller: controller,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        //elevation : 0,
        color: navigationColor,
        backgroundColor: gradientEndColor,
        buttonBackgroundColor: Colors.white,
        height: 50,
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        index: 2, //to select default icon
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
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            color: Colors.black,
            iconSize: 20,
            onPressed: () {},
          ),
          IconButton(
            //icon: Image.asset('assets/newspaper.png',
            //  color: Colors.white),
            icon: Icon(Icons.calendar_today),
            color: Colors.white,
            iconSize: 20,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage2()));
            },
          ),
        ],
        onTap: (index) {
          debugPrint("Current Index is $index");
        },
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCad = safeHeight;
        var widthOfPrimaryCad = heightOfPrimaryCad * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCad;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isONRight = delta > 0;
          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isONRight ? 14 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.cover),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Text(title[i],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontFamily: "SF-PRO-TEXT-REGULAR")),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, bottom: 12.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 22.0, vertical: 6.0),
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Text("Read Later",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
