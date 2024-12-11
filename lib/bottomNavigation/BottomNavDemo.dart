import 'package:flutter/material.dart';
import 'package:miles_education/home/homePageWidget.dart';
import 'package:miles_education/uiwidget/SFTextWidget.dart';

import '../theme/string.dart';

class BottomNavDemo extends StatefulWidget {
  @override
  _BottomNavDemoState createState() => _BottomNavDemoState();
}

class _BottomNavDemoState extends State<BottomNavDemo> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    MyHomePage(),
     Center(child: Sftextwidget(textval: moviePage, colorval: Colors.white, sizeval: 24, fontWeight: FontWeight.bold)),
     Center(child: Sftextwidget(textval: activityPage, colorval: Colors.white, sizeval: 24, fontWeight: FontWeight.bold)),
     Center(child: Sftextwidget(textval: calendarPage, colorval: Colors.white, sizeval: 24, fontWeight: FontWeight.bold)),
     Center(child: Sftextwidget(textval:profilePage, colorval: Colors.white, sizeval: 24, fontWeight: FontWeight.bold)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),

          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(

            backgroundColor: Colors.black38,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items:  [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.movie_filter_outlined),
                label: movie,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.local_fire_department),
                label: activity,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.calendar_today),
                label: calendar,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: profile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
