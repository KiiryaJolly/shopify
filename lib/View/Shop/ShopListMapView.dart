import 'package:flutter/material.dart';
import 'package:flutter_geofence/geofence.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ResturantMapView extends StatefulWidget {
  @override
  State<ResturantMapView> createState() => _ResturantMapViewState();
}

class _ResturantMapViewState extends State<ResturantMapView> {
  late GoogleMapController mapController;

  // final LatLng _center = const LatLng(0.3329, 32.5707);

  double latitude = 0.0;
  double longitude = 0.0;
  @override
  void initState() {
    super.initState();
    Geofence.getCurrentLocation().then((coordinate) {
      setState(() {
        latitude = coordinate!.latitude;
        longitude = coordinate.longitude;
        // print(coordinate.latitude);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Widget build(BuildContext context) {
    return GoogleMap(
      mapToolbarEnabled: true,
      markers: {
        Marker(
          markerId: MarkerId("Mitchel Hall"),
          consumeTapEvents: true,
          position: const LatLng(0.332996, 32.570765),
        ),
        Marker(
          markerId: MarkerId("current"),
          consumeTapEvents: true,
          position: LatLng(latitude, longitude),
        ),
      },
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 1.0,
      ),
    );
  }
}
