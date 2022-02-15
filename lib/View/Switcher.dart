import 'package:flutter/material.dart';
import 'package:hupptest/Geolocation/Geo.dart';
import 'package:hupptest/Money/Money.dart';
import 'package:hupptest/View/Home/Global.dart';

class Switcher extends StatefulWidget {
  Switcher({Key? key}) : super(key: key);

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose your option"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Money(
                      title: "Process your payment",
                      amount: cart,
                    ),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: CircleAvatar(
                radius: 70,
                child: Text("Order"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopifyLocator(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: CircleAvatar(
                radius: 70,
                child: Text("Find Shop"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
