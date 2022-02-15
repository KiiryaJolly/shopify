import 'package:flutter/material.dart';
import 'package:hupptest/View/Home/Global.dart';

class Success extends StatefulWidget {
  Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction Details"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Location for delivery'),
            trailing: Text(
              loc,
            ),
          ),
          ListTile(
              title: Text('User '),
              trailing: Text(
                payment['user'],
              )),
          ListTile(
              title: Text('Amount paid'),
              trailing: Text(
                payment['amount'],
              )),
          ListTile(
            title: Text('Currency'),
            trailing: Text(
              payment['currency'],
            ),
          ),
          ListTile(
            title: Text('Contact'),
            trailing: Text(
              payment['contact'],
            ),
          )
        ],
      ),
    );
  }
}
