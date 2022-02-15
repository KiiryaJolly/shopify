import 'package:flutter/material.dart';

import 'ShopDetail.dart';

class CartCard extends StatefulWidget {
  final String url;
  final int id;
  final String name;
  final List db;
  const CartCard(
      {Key? key,
      required this.url,
      required this.name,
      required this.id,
      required this.db})
      : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: 280,
              child: Image(
                image: AssetImage(widget.url),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShopDetail(
                          index: widget.id,
                          image: widget.url,
                          title: widget.name,
                          details: widget.db,
                        ),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                  child: Text("Select"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
