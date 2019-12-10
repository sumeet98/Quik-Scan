import 'package:flutter/material.dart';
import 'package:quik_scan/pages/home_page.dart';
import 'package:quik_scan/pages/recent_qrs.dart';
import 'package:quik_scan/pages/scanner.dart';
import 'package:quik_scan/pages/recent_scans.dart';


class BottomNavController extends StatefulWidget {

  @override
  _BottomNavControllerState createState() =>
      _BottomNavControllerState();
}

class _BottomNavControllerState
    extends State<BottomNavController> {
  
  final List<Widget> pages = [
    HomePage(
      key: PageStorageKey('Page1'),
    ),
    RecentQrs(
      key: PageStorageKey('Page2'),
    ),
    Scanner(
      key: PageStorageKey('Page3')
    ),
    RecentScans( 
      key: PageStorageKey('Page4')
    ),

  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.code), title: Text('Generator', style: TextStyle(color: Colors.white),), backgroundColor: Colors.indigo),
          BottomNavigationBarItem(
              icon: Icon(Icons.playlist_add), title: Text('Recent QRs', style: TextStyle(color: Colors.white),), backgroundColor: Colors.indigo),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt), title: Text('Scanner', style: TextStyle(color: Colors.white),), backgroundColor: Colors.indigo),   
          BottomNavigationBarItem(
              icon: Icon(Icons.list), title: Text('Recent Scans', style: TextStyle(color: Colors.white),), backgroundColor: Colors.indigo), 
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