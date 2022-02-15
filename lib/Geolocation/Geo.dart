import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_geofence/geofence.dart';
import 'package:hupptest/View/Shop/ShopListMapView.dart';
import 'package:overlay_support/overlay_support.dart';

class ShopifyLocator extends StatefulWidget {
  @override
  _ShopifyLocatorState createState() => _ShopifyLocatorState();
}

class _ShopifyLocatorState extends State<ShopifyLocator> {
  showBottomMsg(String msg) {
    showOverlayNotification(
      (context) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.notifications,
              ),
            ),
            title: Text("$msg"),
            // subtitle: Text('continue'),
            trailing: InkWell(
              onTap: () {
                OverlaySupportEntry.of(context)!.dismiss();
              },
              child: CircleAvatar(
                child: Icon(
                  Icons.close,
                ),
              ),
            ),
          ),
        );
      },
      duration: Duration(seconds: 5),
      position: NotificationPosition.top,
    );
  }

  double latitude = 0.0;
  double longitude = 0.0;
  @override
  void initState() {
    super.initState();

    initPlatformState();

    Geofence.getCurrentLocation().then((coordinate) {
      setState(() {
        latitude = coordinate!.latitude;
        longitude = coordinate.longitude;
      });
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    if (!mounted) return;

    Geofence.startListening(GeolocationEvent.entry, (entry) {
      showBottomMsg("Welcome to Mitchel Shop");
    });

    Geofence.startListening(GeolocationEvent.exit, (entry) {
      showBottomMsg("Byebye to: ${entry.id}");
    });

    Geofence.startListeningForLocationChanges();
    Geofence.backgroundLocationUpdated.stream.listen((event) {
      showBottomMsg(
          "You moved significantly Latitude ${event.latitude} and Longitude ${event.longitude}");
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Shop Details'),
      // ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).pop(),
        label: Icon(Icons.arrow_back_ios_new_rounded),
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
                          child: Text("Listen to background updates"),
                          onPressed: () {
                            Navigator.pop(context);

                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
