import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 30, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () {},
              )
            ],
          )),
      Expanded(
          child: Center(
              child: Text("Create Memes Here",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))))
    ]));
  }
}
