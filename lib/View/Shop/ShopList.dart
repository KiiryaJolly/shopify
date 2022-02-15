import 'package:flutter/material.dart';

import 'dart:ui' as ui;

import 'ShopListView.dart';

class ShopList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShopListState();
  }
}

class ShopListState extends State<ShopList> with TickerProviderStateMixin {
  int activeView = 0;
  EdgeInsets padding = EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0);
  double fromBottom = 0;
  late Animation animation;
  late AnimationController animationController;
  late Animation<Offset> offset;
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // tabController = TabController(vsync: this, length: , initialIndex: 0);
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    animation = Tween<double>(begin: 0.0, end: 250.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));

    offset = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
        .animate(animationController);

    animation.addListener(() {
      setState(() {});
    });
    offset.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: SafeArea(
          child: ShopListView(),
        )

        // getBlurWidget(),
        // Positioned(
        //     bottom: animation.value,
        //     child: Align(
        //       alignment: Alignment.center,
        //       child: SafeArea(
        //         bottom: (animation.value == 0) ? true : false,
        //         minimum: EdgeInsets.only(bottom: 10.0),
        //         child: Container(
        //             width: MediaQuery.of(context).size.width,
        //             height: 50.0,
        //             child: FittedBox(
        //               child: FloatingActionButton(
        //                 onPressed: () {
        //                   if (fromBottom == 100) {
        //                     animationController.reverse();
        //                     setState(() {
        //                       fromBottom = 0;
        //                     });
        //                   } else {
        //                     setState(() {
        //                       fromBottom = 100;
        //                     });
        //                     animationController.forward();
        //                   }
        //                 },
        //                 child: Icon(Icons.filter_list),
        //               ),
        //             )),
        //       ),
        //     )),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: SlideTransition(
        //     position: offset,
        //     child: Container(
        //       height: 250.0,
        //       color: Colors.white,
        //       width: double.infinity,
        //       child: Column(
        //         children: <Widget>[
        //           Padding(
        //             padding: EdgeInsets.symmetric(vertical: 10.0),
        //             child: Text("Filters",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600),),
        //           ),
        //             Container(
        //             decoration: BoxDecoration(
        //             border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.5)))),
        //             ),
        //           Expanded(
        //             child: Container(
        //               child: Wrap(
        //                 children: <Widget>[
        //                   getFilterWidgetIcon(Icons.local_pizza),
        //                   getFilterWidgetIcon(Icons.local_pizza),
        //                   getFilterWidgetIcon(Icons.local_pizza),
        //                   getFilterWidgetIcon(Icons.local_pizza),
        //                   getFilterWidgetIcon(Icons.local_pizza),
        //                   getFilterWidgetIcon(Icons.local_pizza)
        //                 ],
        //               ),
        //             ),
        //           )
        //         ],
        //       ),
        //     )
        //   ),
        // )

        );
  }
}
