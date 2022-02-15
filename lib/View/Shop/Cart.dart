import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  final String url;
  final String name;
  final String price;
  const Cart(
      {Key? key, required this.url, required this.name, required this.price})
      : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(widget.name),
          leading: Image.asset(widget.url),
          trailing: Text("${widget.price}"),
        ),
      ),
    );
  }
}
