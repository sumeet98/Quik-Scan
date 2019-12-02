import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quik_scan/services/authentication.dart';
import 'package:quik_scan/pages/home_page.dart';
import 'package:quik_scan/main.dart';
import 'package:quik_scan/pages/recent_scans.dart';
import 'package:quik_scan/pages/about_us.dart';

// class SampleWidget extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('New')),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.list), title: Text('Records')),
//         ],
//       ),
//       body: Container(),
//     );
//   }
// } 

class BottomNavController extends StatefulWidget {

 // BottomNavController({Key key, this.title}) : super(key: key);

  //final String title;

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
    RecentScans(
      key: PageStorageKey('Page2'),
    ),
    AboutUs(
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
              icon: Icon(Icons.code), title: Text('Generator')),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), title: Text('Recent Codes')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), title: Text('About Us')),
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