import 'package:flutter/material.dart';
import 'package:miles_education/home/homePageWidget.dart';
import 'package:miles_education/uiwidget/SFTextWidget.dart';

class BottomNavDemo extends StatefulWidget {
  @override
  _BottomNavDemoState createState() => _BottomNavDemoState();
}

class _BottomNavDemoState extends State<BottomNavDemo> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    MyHomePage(),
    const Center(child: Sftextwidget(textval: "Movie Page", colorval: Colors.white, sizeval: 24, fontWeight: FontWeight.bold)),
    const Center(child: Sftextwidget(textval: "Activity Page", colorval: Colors.white, sizeval: 24, fontWeight: FontWeight.bold)),
    const Center(child: Sftextwidget(textval: "Calendar Page", colorval: Colors.white, sizeval: 24, fontWeight: FontWeight.bold)),
    const Center(child: Sftextwidget(textval: "Profile Page", colorval: Colors.white, sizeval: 24, fontWeight: FontWeight.bold)),
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
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.movie_filter_outlined),
                label: 'Movie',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_fire_department),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
