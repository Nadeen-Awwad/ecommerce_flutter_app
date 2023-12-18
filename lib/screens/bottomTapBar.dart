import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/categories.dart';
import 'package:flutter_application_1/screens/dahsborad.dart';
import 'package:flutter_application_1/screens/search_screen.dart';

import 'profile_page.dart';
import 'wishList.dart';

void main() {
  runApp(MyTabBarApp());
}

class MyTabBarApp extends StatefulWidget {
  @override
  _MyTabBarAppState createState() => _MyTabBarAppState();
}

class _MyTabBarAppState extends State<MyTabBarApp> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Dashboard(),
    Categories(),
    SearchScreen(),
   WishList(),
   CustomCardList(),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'WishList',
            ),
              BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}





