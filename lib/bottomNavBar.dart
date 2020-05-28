import 'package:flutter/material.dart';
import 'package:jurustani/pages/perlengkapan_page.dart';
import 'package:jurustani/pages/tutorial_page.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedTabIndex = 0;

  void _onNavBarTapped(int index){
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[
      TutorialPage(),
      PerlengkapanPage(),
      Text('Halaman Favorit'),
      Text('Halaman Profil'),
    ];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment), 
        title: Text('Tutorial'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.build), 
        title: Text('Perlengkapan'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite), 
        title: Text('Favorit'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person), 
        title: Text('Profil'),
      ),
    ];

    final _bottomNavBar = BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: _onNavBarTapped,
    );

    return Scaffold(
      body: Center(
        child: _listPage[_selectedTabIndex],
      ),
      bottomNavigationBar: _bottomNavBar,
    );
  }
}