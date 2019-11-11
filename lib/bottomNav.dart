import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'main.dart';
import 'main_menu.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

class SampleWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('New')),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), title: Text('Records')),
        ],
      ),
      body: Container(),
    );
  }
} 

class bottomNav extends StatefulWidget {

  //bottomNav({Key key, this.title}) : super(key: key);

  //final String title;

    final User user;

  bottomNav({Key key, @required this.user}) : super(key: key);

  @override
  _bottomNavState createState() =>
      _bottomNavState();
}

class _bottomNavState
    extends State<bottomNav> {
  
  final List<Widget> pages = [
    Page1(
      key: PageStorageKey('Page1'),
    ),
    Page2(
      key: PageStorageKey('Page2'),
    ),
    Page3(
      key: PageStorageKey('Page3')
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt), title: Text('Scanner')),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), title: Text('Recent Scans')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('Settings')),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}