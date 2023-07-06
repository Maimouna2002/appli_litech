import 'package:flutter/material.dart';
import 'package:stageapp/pages/account_page.dart';
import 'package:stageapp/pages/explore_page.dart';
import 'package:stageapp/pages/home_page.dart';
import 'package:stageapp/pages/my_course_page.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with SingleTickerProviderStateMixin {
  int pageIndex = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      MyCoursesPage(),
      ExplorePage(),
      AccountPage(),
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) {
          selectedTab(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Hero(
              tag: 'home-icon',
              child: Icon(Icons.home),
            ),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Hero(
              tag: 'courses-icon',
              child: Icon(Icons.school),
            ),
            label: 'Mes cours',
          ),
          BottomNavigationBarItem(
            icon: Hero(
              tag: 'explore-icon',
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: _animationController,
              ),
            ),
            label: 'Explorer',
          ),
          BottomNavigationBarItem(
            icon: Hero(
              tag: 'account-icon',
              child: Icon(Icons.person),
            ),
            label: 'Compte',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void selectedTab(int index) {
    if (index == 2) {
      if (_animationController.isCompleted) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
    } else {
      setState(() {
        pageIndex = index;
      });
    }
  }
}
