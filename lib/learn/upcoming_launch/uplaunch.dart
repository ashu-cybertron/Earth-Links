import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter_universe/learn/upcoming_launch/upmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Uplaunch1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var launchService = LaunchService();
    return FutureProvider(
      create: (context) => launchService.fetchLaunch(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Uplaunch2(),
      ),
    );
  }
}

class Uplaunch2 extends StatefulWidget {
  @override
  _Uplaunch2State createState() => _Uplaunch2State();
}

class _Uplaunch2State extends State<Uplaunch2> {
  Timer timer;
  Launch launch;
  String countdown;

  @override
  void initState() {
    countdown = '';
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (launch != null) {
        var diff = launch.launchUTC.difference(DateTime.now().toUtc());
        setState(() {
          countdown = durationToString(diff);
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    launch = Provider.of<Launch>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('SpaceX Launch Tracker', style: GoogleFonts.ubuntu()),
          centerTitle: true,
        ),
        body: (launch != null)
            ? Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Next Launch',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 12.0, color: Colors.yellow)),
                          Text(countdown,
                              style: GoogleFonts.sourceCodePro(fontSize: 50.0)),
                          Text(launch.rocket.rocketName,
                              style: GoogleFonts.ubuntu(fontSize: 25.0)),
                        ],
                      ),
                    ),
                    Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 50.0),
                          child: Image.asset('assets/rocket.png'),
                        ))
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  String durationToString(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}

class LaunchService {
  Future<Launch> fetchLaunch() async {
    var response =
        await http.get('https://api.spacexdata.com/v3/launches/upcoming');

    var json = convert.jsonDecode(response.body);

    var launch = Launch.fromJson(json[0]);

    return launch;
  }
}
