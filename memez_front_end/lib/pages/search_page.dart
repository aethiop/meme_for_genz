import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 30, bottom: 0),
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
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Material(
                color: Colors.red,
                elevation: 10,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Enter Search Here..",
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: InputBorder.none),
                ),
              ))
        ],
      ),
    );
  }
}
