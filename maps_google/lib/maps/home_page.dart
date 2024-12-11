import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePageGoogle extends StatefulWidget {
  const HomePageGoogle({super.key});

  @override
  State<HomePageGoogle> createState() => _MyWidgetState();
}

final Completer<GoogleMapController> _completer = Completer();

const CameraPosition _cameraPosition = CameraPosition(target: LatLng(4.3113515,-74.8136808));

class _MyWidgetState extends State<HomePageGoogle> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: GoogleMap(initialCameraPosition: _cameraPosition));
  }
}
