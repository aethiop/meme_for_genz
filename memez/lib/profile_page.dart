import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 30, bottom: 0),
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage('assets/avatar_profile.png')),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Person 1",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                      ),
                                    ),
                                    Text("Funny AF....",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ))
                ])),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
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
                      Text("🤣",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                          )),
                      Text("Hilarious",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ))
                    ],
                  )
                ],
              ),
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
