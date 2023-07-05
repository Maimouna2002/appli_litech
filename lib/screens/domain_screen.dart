import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/const.dart';
import '../widgets/header_inner.dart';
import '../widgets/offer_card.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Constants.mainPadding,
                  vertical: Constants.mainPadding,
                ),
                height: 44,
                width: 44,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    backgroundColor: Colors.white.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Icon(
                    Icons.keyboard_backspace,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Constants.mainPadding,
                  vertical: Constants.mainPadding,
                ),
                height: 44,
                width: 44,
                child: TextButton(
                  onPressed: () {
                    debugPrint("Menu Pressed");
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    backgroundColor: Colors.white.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          HeaderInner(),
          ListView(
            children: <Widget>[
              SizedBox(height: Constants.mainPadding * 3),
              Center(
                child: Text(
                  "UI/UX\nCourses",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: Constants.mainPadding * 2),
              Container(
                padding: EdgeInsets.fromLTRB(
                  Constants.mainPadding,
                  Constants.mainPadding * 2,
                  Constants.mainPadding,
                  Constants.mainPadding,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
                  color: Colors.white,
                ),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    CardCourses(
                      image: AssetImage("assets/images/icon_1.png"),
                      color: Constants.lightPink,
                      title: "Adobe XD Prototyping",
                      hours: "10 hours, 19 lessons",
                      progress: "25%",
                      percentage: 0.25,
                      key: Key('card1'), 
                    ),
                    CardCourses(
                       image: AssetImage("assets/images/icon_2.png"),
                      color: Constants.lightYellow,
                      title: "Sketch shortcuts and tricks",
                      hours: "10 hours, 19 lessons",
                      progress: "50%",
                      percentage: 0.5,
                      key: Key('card2'), 
                    ),
                    CardCourses(
                      image: AssetImage("assets/images/icon_3.png"),
                      color: Constants.lightViolet,
                      title: "UI Motion Design in After Effects",
                      hours: "10 hours, 19 lessons",
                      progress: "75%",
                      percentage: 0.75,
                      key: Key('card3'), 
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
