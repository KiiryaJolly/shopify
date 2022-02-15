import 'package:flutter/material.dart';
import 'package:hupptest/View/Home/Global.dart';

import 'package:hupptest/View/Shop/ShopingCart.dart';

import 'MenuView.dart';

class ShopDetail extends StatefulWidget {
  final int index;
  final String image;
  final String title;
  final List details;
  ShopDetail(
      {required this.index,
      required this.image,
      required this.title,
      required this.details});

  @override
  State<StatefulWidget> createState() {
    return ShopDetailState();
  }
}

class ShopDetailState extends State<ShopDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          InkResponse(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoppingCart(
                    storage: cart,
                  ),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height / 3.5,
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Hero(
                tag: widget.index,
                child: Image.asset(widget.image),
              )),
          Expanded(
            child: MenuView(
              items: widget.details,
            ),
          )
        ],
      ),
    );
  }
}
