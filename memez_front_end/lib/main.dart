import 'package:flutter/material.dart';
import 'pages/search_page.dart';
import 'pages/home_page.dart';
import 'pages/notification_page.dart';
import 'pages/create_page.dart';

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
        child: Container(color: Color(0xFF2d3447)),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: Color(0xFFE52020)),
        showSelectedLabels: true,
        unselectedIconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Color(0xFF2d3447),
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
          });
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home", style: TextStyle(color: Colors.white))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              title: Text("Search", style: TextStyle(color: Colors.white))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
              ),
              title: Text(
                "Notification",
                style: TextStyle(color: Colors.white),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text(
                "Create",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      backgroundColor: Color(0xFF2d3447),
    );
  }
}
