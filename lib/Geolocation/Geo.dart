import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_geofence/geofence.dart';
import 'package:hupptest/View/Shop/ShopListMapView.dart';
import 'package:geolocator/geolocator.dart';

class ShopifyLocator extends StatefulWidget {
  @override
  _ShopifyLocatorState createState() => _ShopifyLocatorState();
}

class _ShopifyLocatorState extends State<ShopifyLocator> {
  String _platformVersion = 'Unknown';
  showBottomMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
  }

  double latitude = 0.0;
  double longitude = 0.0;
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().displayedStream.listen((receivedNotification) {
      String? createdSourceText = AwesomeAssertUtils.toSimpleEnumString(
          receivedNotification.createdSource);
      showBottomMsg("$createdSourceText notification displayed");
    });

    initPlatformState();
    //determineLivePosition();

    /*Geofence.getCurrentLocation().then((coordinate) {
      setState(() {
        latitude = coordinate!.latitude;
        longitude = coordinate.longitude;
      });
    });*/
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    Geofence.initialize();
    Geofence.startListening(GeolocationEvent.entry, (entry) {
      showBottomMsg("Welcome to: ${entry.id}");
    });

    /*Geofence.startListening(GeolocationEvent.exit, (entry) {
      showBottomMsg("Byebye to: ${entry.id}");
    });*/

    setState(() {});
  }


/// Determine the current position of the device.
///
void determineLivePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.

final LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.high,
  distanceFilter: 100,
);
Geolocator.getPositionStream(locationSettings: locationSettings).listen(
    (Position? position) {
      if(position!= null){
        setState(() {
        latitude= position.latitude;
        longitude= position.longitude;

      });
      }
      
        //print(position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}');
    });
}


  Future<void> showBasicNotification(int id) async {
    var timezone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'basic_channel',
        title: 'Simple Notification',
        body: 'Simple body',
      ),
      schedule: NotificationInterval(
        interval: 5,
        timeZone: timezone,
        preciseAlarm: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    determineLivePosition();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Details'),
      ),
      body: Stack(
        children: <Widget>[
          ResturantMapView(),
          Positioned(
            bottom: -100,
            left: -120,
            child: SizedBox(
              width: 500,
              height: 200,
              child: Column(
                children: [
                  Text('Current Longitudes : $longitude\n'),
                  Text('Current Latitudes: $latitude\n'),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showBottomMenu(),
        label: Text("More"),
      ),
    );
  }

  void showBottomMenu() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Container(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: Text("Add region"),
                          onPressed: () {
                            Geolocation location = Geolocation(
                                latitude: 0.332996,
                                longitude: 32.570765,
                                radius: 20.0,
                                id: "Mitchell");
                            showBasicNotification(0);

                            Geofence.addGeolocation(
                                    location, GeolocationEvent.entry)
                                .then((onValue) {
                              showBottomMsg(
                                  "Georegion added Your geofence has been added!");
                            }).catchError((onError) {
                              showBottomMsg("great failure");
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            child: Text("Listen to background updates"),
                            onPressed: () {
                              Geofence.startListeningForLocationChanges();
                              Geofence.backgroundLocationUpdated.stream
                                  .listen((event) {
                                showBottomMsg("You moved significantly");
                              });
                            }),
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
