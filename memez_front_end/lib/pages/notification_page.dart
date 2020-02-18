import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
                  Icons.menu,
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
              child: Text("No new notifications",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))))
    ]));
  }
}
