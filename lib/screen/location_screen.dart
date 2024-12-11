import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:share_plus/share_plus.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController? _controller;
  Position? _currentPosition;
  LatLng? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    _currentPosition = await Geolocator.getCurrentPosition();
    setState(() {
      _currentLocation = LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
    });

    _controller?.animateCamera(CameraUpdate.newLatLng(_currentLocation!));
  }

  void _shareLocation() {
    if (_currentLocation != null) {
      final String locationLink = 'https://www.google.com/maps/search/?api=1&query=${_currentLocation!.latitude},${_currentLocation!.longitude}';
      Share.share('Mi ubicación: $locationLink');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicación'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: _shareLocation,
          ),
        ],
      ),
      body: _currentLocation == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              initialCameraPosition: CameraPosition(
                target: _currentLocation!,
                zoom: 15.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('current_location'),
                  position: _currentLocation!,
                ),
              },
            ),
    );
  }
}
