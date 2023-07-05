import 'package:flutter/material.dart';

import '../utils/const.dart';
import '../widgets/header.dart';
import '../widgets/offer_card.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchControl = TextEditingController();
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchControl.dispose();
    myFocusNode.dispose();
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Constants.mainPadding,
                  vertical: Constants.mainPadding,
                ),
                height: 44,
                width: 44,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    backgroundColor: Colors.white.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    debugPrint("Menu pressed");
                  },
                  child: Icon(Icons.menu, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Header(),
          Padding(
            padding: EdgeInsets.all(Constants.mainPadding),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                SizedBox(height: Constants.mainPadding * 2),

                // 1. Welcome User
                Text(
                  "Welcome back\nStudent!",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: Constants.mainPadding),

                // 2. Search Textfield
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: TextField(
                    focusNode: myFocusNode,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Constants.textDark,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: "Cherchez les Offres de stage",
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Constants.textDark,
                        ),
                        onPressed: () {
                          debugPrint("Search pressed");
                        },
                      ),
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    maxLines: 1,
                    controller: _searchControl,
                  ),
                ),

                SizedBox(height: Constants.mainPadding),

                // 3. Start Learning Button Section
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Color(0xFFFEF3F3),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Découvrez de nouvelles opportunités de stage !",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Constants.textDark,
                            ),
                          ),
                          SizedBox(height: 10.0),

                          // Categories Button
                          Container(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigate to Learning
                                debugPrint("Pressed here");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Constants.salmonMain,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        "Domaines",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Image Researching Girl
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Image.asset(
                        "assets/images/researching.png",
                        width: 200,
                        height: 104,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.0),

                Text(
                  "Offres Recentes",
                  style: TextStyle(
                    color: Constants.textDark,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 20.0),

                // List of courses
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    CardCourses(
                      key: Key('card1'),
                      image: AssetImage("assets/images/icon_1.png"),
                      color: Constants.lightPink,
                      title: "Adobe XD Prototyping",
                      hours: "10 hours, 19 lessons",
                      progress: "25%",
                      percentage: 0.25,
                    ),
                    CardCourses(
                      key: Key('card2'),
                      image: AssetImage("assets/images/icon_2.png"),
                      color: Constants.lightYellow,
                      title: "Sketch shortcuts and tricks",
                      hours: "10 hours, 19 lessons",
                      progress: "50%",
                      percentage: 0.5,
                    ),
                    CardCourses(
                      key: Key('card3'),
                      image: AssetImage("assets/images/icon_3.png"),
                      color: Constants.lightViolet,
                      title: "UI Motion Design in After Effects",
                      hours: "10 hours, 19 lessons",
                      progress: "75%",
                      percentage: 0.75,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
