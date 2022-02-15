import 'package:flutter/material.dart';
import 'package:hupptest/View/Home/Global.dart';
import 'package:hupptest/View/Shop/Cart.dart';
import 'package:hupptest/View/Switcher.dart';

class ShoppingCart extends StatefulWidget {
  final storage;
  ShoppingCart({Key? key, this.storage}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.storage.length; i++) {
      print(widget.storage[i]["amount"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Your WhistList"),
      ),
      body: SafeArea(
        child: cart.isEmpty
            ? Card(
                child: Center(
                  child: Text("You haven't added anyting"),
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Expanded(
                      flex: 2,
                      child: ListView(
                        children: List.generate(
                          widget.storage.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Cart(
                              url: widget.storage[index]['url'],
                              name: widget.storage[index]['item'],
                              price: widget.storage[index]['price']
                                  .replaceAll("ugx", ""),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          child: Text("Clear"),
                          onPressed: () {
                            Navigator.pop(context);
                            cart.clear();
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Switcher(),
                                fullscreenDialog: true,
                              ),
                            );
                          },
                          child: Text("Proceed"),
                        )
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
