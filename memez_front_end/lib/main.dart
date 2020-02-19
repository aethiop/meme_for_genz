import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'pages/search_page.dart';
import 'pages/home_page.dart';
import 'pages/notification_page.dart';
import 'pages/create_page.dart';
import 'pages/profile_page.dart';

void main() => runApp(MaterialApp(
      home: MainApp(),
      debugShowCheckedModeBanner: false,
    ));

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    SearchPage(),
    NotificationPage(),
    CreatePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 16.0,
        child: Container(
          color: Color(0xFF2d3447),
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Hero(
                          tag: 'profile',
                          child: Image.asset(
                            'assets/avatar_profile.png',
                            fit: BoxFit.cover,
                            width: 120,
                            height: 120,
                          )))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("37k",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 28,
                          )),
                      Text("Subscribers",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ))
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("20k",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 28,
                          )),
                      Text("Subscribed",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ))
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("1015",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 28,
                          )),
                      Text("XP",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ))
                    ],
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.person, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text("My Profile",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                          ]))),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.bookmark, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Saved",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                      ]))),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.settings, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Settings",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                      ]))),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.question_answer, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text("FAQ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                      ]))),
            ],
          ),
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
          animationDuration: Duration(milliseconds: 300),
          height: 54,
          backgroundColor: Color(0xFF2d3447),
          color: Colors.white,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: <Widget>[
            Icon(Icons.home, color: Color(0xFF2d3447)),
            Icon(Icons.search, color: Color(0xFF2d3447)),
            Icon(Icons.notifications, color: Color(0xFF2d3447)),
            Icon(Icons.add, color: Color(0xFF2d3447))
          ]),
      backgroundColor: Color(0xFF2d3447),
    );
  }
}
