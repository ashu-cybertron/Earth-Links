import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class IssMap extends StatefulWidget {
  IssMap({Key key, this.latitude, this.longitude}) : super(key: key);
  //final String title;
  final double latitude;
  final double longitude;

  @override
  _IssMapState createState() => _IssMapState();
}

class _IssMapState extends State<IssMap> {
  Marker marker;
  Circle circle;
  GoogleMapController _controller;

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 0,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/satiss.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(
      double latitude, double longitude, Uint8List imageData) {
    LatLng latlng = LatLng(latitude, longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: CircleId("car"),
          radius: 3,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    Uint8List imageData = await getMarker();
    //var location = await _locationTracker.getLocation();
    updateMarkerAndCircle(widget.latitude, widget.longitude, imageData);

    _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        //bearing: 192.8334901395799,
        target: LatLng(widget.latitude, widget.longitude),
        tilt: 0,
        zoom: 6)));
    updateMarkerAndCircle(widget.latitude, widget.longitude, imageData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking ISS'),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: initialLocation,
        markers: Set.of((marker != null) ? [marker] : []),
        circles: Set.of((circle != null) ? [circle] : []),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_searching),
          onPressed: () {
            getCurrentLocation();
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
