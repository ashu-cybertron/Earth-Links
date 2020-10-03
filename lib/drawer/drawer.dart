import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_universe/Quiz/categories.dart';
import 'package:flutter_universe/data/constants.dart';
import 'package:flutter_universe/learn/learn.dart';
import 'package:flutter_universe/nasa/home_page2.dart';
import 'package:flutter_universe/planets/home_page1.dart';
import 'package:flutter_universe/satellite/satellites.dart';
import 'package:flutter_universe/search/search.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Neighbourhood/Neighbourhood.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerPage> {
  Offset _offset = Offset(0, 0);
  GlobalKey globalKey = GlobalKey();

  List<double> limits = [];
  bool isMenuOpen = false;

  @override
  void initState() {
    limits = [0, 0, 0, 0, 0, 0];

    WidgetsBinding.instance.addPostFrameCallback(getPosition);
    super.initState();
  }

  getPosition(duration) {
    RenderBox renderBox = globalKey.currentContext.findRenderObject();
    final position = renderBox.localToGlobal(Offset.zero);

    double start = position.dy - 20;
    double contLimit = position.dy + renderBox.size.height - 20;
    double step = (contLimit - start) / 5;
    limits = [];
    for (double x = start; x <= contLimit; x = x + step) {
      limits.add(x);
    }
    print(limits);

    setState(() {
      limits = limits;
    });
  }

  double getSize(int x) {
    if (x == 1 || x == 2 || x == 4) {
      double size =
          (_offset.dy > limits[x] && _offset.dy < limits[x + 1]) ? 20 : 20;
      return size;
    }
    double size =
        (_offset.dy > limits[x] && _offset.dy < limits[x + 1]) ? 30 : 20;
    return size;
  }

  double sizePhoto() {
    // to get position of container
    RenderBox renderBox1 = globalKey.currentContext.findRenderObject();
    final position = renderBox1.localToGlobal(Offset.zero);

    double size = (_offset.dy < position.dy && _offset.dy > 20)
        ? MediaQuery.of(context).size.width * 0.65 / 4
        : MediaQuery.of(context).size.width * 0.65 / 4;
    return size;
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * 0.65;
    double menuContainerHeight = mediaQuery.height / 2;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: mediaQuery.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(255, 56, 108, 1.0),
            Color.fromRGBO(255, 75, 73, 1)
          ])),
          child: Stack(
            children: [
              HomePage1(),
              AnimatedPositioned(
                duration: Duration(milliseconds: 1500),
                left: isMenuOpen ? 0 : -sidebarSize + 20,
                top: 0,
                curve: Curves.elasticOut,
                child: SizedBox(
                  width: sidebarSize,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      if (details.localPosition.dx <= sidebarSize) {
                        setState(() {
                          _offset = details.localPosition;
                        });
                      }
                      if (details.localPosition.dx > sidebarSize - 20 &&
                          details.delta.distanceSquared > 2) {
                        setState(() {
                          isMenuOpen = true;
                        });
                      }
                    },
                    onPanEnd: (details) {
                      setState(() {
                        _offset = Offset(0, 0);
                      });
                    },
                    child: Stack(
                      children: [
                        CustomPaint(
                          size: Size(sidebarSize, mediaQuery.height),
                          painter: DrawerPainter(offset: _offset),
                        ),
                        Container(
                          height: mediaQuery.height,
                          width: sidebarSize,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: mediaQuery.height * 0.25,
                                child: Center(
                                  child: FittedBox(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                            "assets/earthlinkssss.png",
                                          ),
                                          radius: sidebarSize / 5,
                                          //radius: sizePhoto(),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Earth Links",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Divider(thickness: 1),
                              Container(
                                key: globalKey,
                                width: double.infinity,
                                height: menuContainerHeight,
                                child: Column(
                                  children: [
                                    MyButton(
                                        text: "Learn",
                                        iconData: Icons.person,
                                        textSize: getSize(0),
                                        height: (menuContainerHeight) / 5,
                                        tag: 0),
                                    MyButton(
                                        text: "Track Satellites",
                                        iconData: Icons.satellite,
                                        textSize: getSize(1),
                                        height: (menuContainerHeight) / 5,
                                        tag: 1),
                                    MyButton(
                                        text: "Neighbourhood",
                                        iconData: Icons.notifications,
                                        textSize: getSize(2),
                                        height: (menuContainerHeight) / 5,
                                        tag: 2),
                                    MyButton(
                                        text: "Quizzes",
                                        iconData: Icons.chat,
                                        textSize: getSize(3),
                                        height: (menuContainerHeight) / 5,
                                        tag: 3),
                                    MyButton(
                                        text: "Merchandise",
                                        iconData: Icons.shopping_cart,
                                        textSize: getSize(4),
                                        height: (menuContainerHeight) / 5,
                                        tag: 4),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 400),
                          right: (isMenuOpen) ? 10 : sidebarSize,
                          bottom: 30,
                          child: IconButton(
                            enableFeedback: true,
                            icon: Icon(
                              Icons.keyboard_backspace,
                              color: Colors.white70,
                              size: 30,
                            ),
                            onPressed: () {
                              this.setState(() {
                                isMenuOpen = false;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: isMenuOpen
            ? SizedBox(height: 0)
            : CurvedNavigationBar(
                //elevation : 0,
                color: navigationColor,
                backgroundColor: gradientEndColor,
                buttonBackgroundColor: Colors.white,
                height: 50,
                animationDuration: Duration(milliseconds: 200),
                animationCurve: Curves.bounceInOut,
                index: 1, //to select default icon
                items: <Widget>[
                  IconButton(
                    icon: Image.asset('assets/profile_icon.png'),
                    color: Colors.white,
                    iconSize: 20,
                    onPressed: () {
                      setState(() {
                        isMenuOpen = true;
                      });
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/menu_icon.png'),
                    color: Colors.white,
                    iconSize: 20,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.white,
                    iconSize: 20,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReadHistory()),
                      );
                    },
                  ),
                  IconButton(
                    //icon: Image.asset('assets/newspaper.png',
                    //  color: Colors.white),
                    icon: Icon(Icons.calendar_today),
                    color: Colors.white,
                    iconSize: 20,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage2()),
                      );
                    },
                  ),
                ],
                onTap: (index) {
                  debugPrint("Current Index is $index");
                  // if (index == 4) {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => HomePage2()));
                },
              ),
      ),
    );
  }
}

class DrawerPainter extends CustomPainter {
  final Offset offset;
  DrawerPainter({this.offset});

  double getControlPointer(double width) {
    if (offset.dx == 0) {
      return width;
    } else {
      return offset.dx > width ? offset.dx : width + 75;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = navigationColor
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(-size.width, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(
        getControlPointer(size.width), offset.dy, size.width, size.height);
    path.lineTo(-size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final double textSize;
  final double height;
  final int tag;

  MyButton({this.text, this.iconData, this.textSize, this.height, this.tag});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            iconData,
            color: Colors.white70,
          ),
          SizedBox(width: 20),
          Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: textSize),
          ),
        ],
      ),
      onPressed: () {
        if (tag == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Neighbourhood()));
        } else if (tag == 1) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Satellite()));
        } else if (tag == 3) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => QuizHomePage()));
        } else if (tag == 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeLearn()));
        } else if (tag == 4) {
          launch('https://aditinnaik.wixsite.com/mysite');
        }
      },
    );
  }
}
