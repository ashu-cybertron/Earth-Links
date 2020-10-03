import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import 'pages.dart';

class Neighbourhood extends StatefulWidget {
  Neighbourhood({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NeighbourhoodState createState() => _NeighbourhoodState();
}

class _NeighbourhoodState extends State<Neighbourhood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: pages,
        enableLoop: true,
        fullTransitionValue: 600,
        enableSlideIcon: true,
        waveType: WaveType.liquidReveal,
      ),
    );
  }
}
