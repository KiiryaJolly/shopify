import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofence/geofence.dart';
import 'package:hupptest/firebase_options.dart';
import 'package:overlay_support/overlay_support.dart';
import 'View/Root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Geofence.initialize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        // color: Colors.orangeAccent,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        title: "Shopify",
        home: Root(),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/root': (context) => Root(),
        },
      ),
    );
  }
}
