import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';

import '../data.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var cardAspectRatio = 9.0 / 14.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _HomePageState extends State<HomePage> {
  var doubleTapped = false;
  var currentPage = images.length - 1.0;

  double dragDistance = 0.0;
  bool didDragStart = false;
  Offset dragDelta;
  bool onTap = false;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    return SingleChildScrollView(
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                  )
                ],
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Hero(
                  transitionOnUserGestures: true,
                  tag: 'red',
                  child: Container(
                      child: DefaultTabController(
                          length: 2,
                          child: TabBar(
                            indicator: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 5),
                                    blurRadius: 4,
                                    spreadRadius: 0)
                              ],
                              color: Colors.red,
                            ),
                            tabs: <Widget>[
                              Container(
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 8),
                                      child: Text("Subscribed",
                                          style: TextStyle(
                                            fontFamily: "Calibre-Semibold",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 22.0,
                                            letterSpacing: 1.0,
                                          )))),
                              Container(
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 8),
                                      child: Text("For You",
                                          style: TextStyle(
                                            fontFamily: "Calibre-Semibold",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 22.0,
                                            letterSpacing: 1.0,
                                          ))))
                            ],
                          ))))),
          Stack(
            children: <Widget>[
              CardScrollWidget(currentPage),
              Positioned.fill(
                  child: PageView.builder(
                itemCount: images.length,
                controller: controller,
                reverse: true,
                itemBuilder: (context, index) {
                  return Container();
                },
              ))
            ],
          )
        ],
      ),
    );
  }
}

class CardScrollWidget extends StatefulWidget {
  final currentPage;
  const CardScrollWidget(this.currentPage);
  @override
  _CardScrollWidgetState createState() => _CardScrollWidgetState();
}

class _CardScrollWidgetState extends State<CardScrollWidget> {
  bool _isLiked = false;
  int _likeCount = 0;
  final padding = 20.0;
  final verticalInset = 20.0;

  void _toggleLike() {
    setState(() {
      if (_isLiked) {
        _likeCount -= 1;
        _isLiked = false;
      } else {
        _likeCount += 1;
        _isLiked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - widget.currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.black, boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(3.0, 6.0),
                        blurRadius: 10.0)
                  ]),
                  child: AspectRatio(
                    aspectRatio: cardAspectRatio,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(images[i], fit: BoxFit.fitWidth),
                        Positioned.directional(
                            textDirection: TextDirection.ltr,
                            bottom: 10,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      IconButton(
                                          icon: Icon(
                                            Icons.favorite,
                                            size: 30.0,
                                            color: (_isLiked
                                                ? Colors.red
                                                : Colors.white),
                                          ),
                                          onPressed: _toggleLike),
                                      Text(
                                        userAttr[i][0].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      IconButton(
                                          icon: Icon(
                                            Icons.comment,
                                            size: 30.0,
                                            color: Colors.white,
                                          ),
                                          onPressed: null),
                                      Text(
                                        userAttr[i][1],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.share,
                                        size: 30.0,
                                        color: Colors.white,
                                      ),
                                      onPressed: null),
                                ],
                              ),
                            )),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Container(
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(right: 9),
                                                  child: CircleAvatar(
                                                      radius: 25,
                                                      backgroundImage: AssetImage(
                                                          'assets/avatar_profile.png'))),
                                              Column(children: <Widget>[
                                                Text(title[i],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20.0,
                                                        fontFamily:
                                                            "SF-Pro-Text-Regular"))
                                              ])
                                            ])))),
                              ],
                            )),
                      ],
                    ),
                  ),
                )),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
