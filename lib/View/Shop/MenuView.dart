import 'package:flutter/material.dart';
import 'package:hupptest/View/Home/Global.dart';

// ignore: must_be_immutable
class MenuView extends StatefulWidget {
  final List items;
  const MenuView({Key? key, required this.items}) : super(key: key);
  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        key: new PageStorageKey('shop items'),
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset(
                widget.items[index]['img'],
              ),
              title: Text("${widget.items[index]['name']}"),
              trailing: Text("${widget.items[index]['price']}"),
              onTap: () {
                var item = {
                  'item': widget.items[index]['name'],
                  'price': widget.items[index]['price'],
                  'url': widget.items[index]['img'],
                };
                // print(item);
                cart.add(item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text("Add ${widget.items[index]['name']} to cart"),
                  ),
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10.0,
          );
        },
        itemCount: widget.items.length);
  }
}
