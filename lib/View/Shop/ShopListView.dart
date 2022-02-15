import 'package:flutter/material.dart';
import 'package:hupptest/View/Shop/CartCard.dart';

String image = 'pictures/images/set.jpg';
String shoe = 'pictures/images/shoes.jpg';
String gadget = 'pictures/images/gadgets.jpg';
String url = "pictures/images/";

// ignore: must_be_immutable
class ShopListView extends StatelessWidget {
  // ignore: non_constant_identifier_names

  String imageUrl =
      "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXxlbnwwfHwwfHw%3D&w=1000&q=80";
  List<dynamic> clothes = [
    {'name': 'shirt', 'price': 'ugx 25000', 'img': url + 'shirt.jpg'},
    {'name': 'tshirt', 'price': 'ugx 30000', 'img': url + 'tshirt.jpg'},
    {'name': 'skirt', 'price': 'ugx 15000', 'img': url + 'skirts.jpg'},
    {'name': 'trouser', 'price': 'ugx 35000', 'img': url + 'trouser.jpg'},
    {'name': 'top', 'price': 'ugx 7000', 'img': url + 'top.jpg'},
    {'name': 'dress', 'price': 'ugx 25000', 'img': url + 'dress.jpg'},
    {'name': 'turkey shirt', 'price': 'ugx 35000', 'img': url + 'c1.jpg'},
    {'name': 'night', 'price': 'ugx 15000', 'img': url + 'night.jpg'},
  ];

  List<dynamic> shoes = [
    {'name': 'adidas', 'price': 'ugx 70000', 'img': url + 'adidas.jpg'},
    {'name': 'vans', 'price': 'ugx 60000', 'img': url + 'vans.jpg'},
    {'name': 'sports Shoes', 'price': 'ugx 50000', 'img': url + 'sports.jpg'},
    {'name': 'gentle shoe', 'price': 'ugx 150000', 'img': url + 'gentle.jpg'},
    {'name': 'allstars', 'price': 'ugx 80000', 'img': url + 'allstar.jpg'},
    {'name': 'ascot', 'price': 'ugx 200000', 'img': url + 'ascot.jpg'},
    {
      'name': 'barker shoe',
      'price': 'ugx 175000',
      'img': url + 'barker shoes.jpg'
    },
    {'name': 'heels', 'price': 'ugx 45000', 'img': url + 'heels.jpg'},
  ];

  List<dynamic> gadgets = [
    {
      'name': 'sumsang phone',
      'price': 'ugx 2,000,000',
      'img': url + 'sumsang.jpg'
    },
    {'name': 'tecno phone', 'price': 'ugx 750,000', 'img': url + 'tecno.jpg'},
    {'name': 'hp laptop', 'price': 'ugx 1,500,000', 'img': url + 'hp.jpg'},
    {'name': 'dell laptop', 'price': 'ugx 1,750,000', 'img': url + 'dell.jpg'},
    {'name': 'macbook', 'price': 'ugx 3,000,000', 'img': url + 'macbook.jpg'},
    {'nmae': 'nokia phone', 'price:': 'ugx 150,000', 'img': url + 'nokia.jpg'},
  ];

  List<dynamic> itemList = [
    {'name': 'Clothes', 'url': image},
    {'name': 'Shoes', 'url': shoe},
    {'name': 'Gadgets', 'url': gadget},
  ];
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    List<dynamic> collection = [clothes, shoes, gadgets];

    // TODO: implement build
    return ListView(
      children: List.generate(
        itemList.length,
        (index) => CartCard(
            id: index,
            url: itemList[index]['url'],
            name: itemList[index]['name'],
            db: collection[index]),
      ),
    );
  }
}
