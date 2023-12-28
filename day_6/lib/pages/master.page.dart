import 'package:day_6/pages/camert.page.dart';
import 'package:day_6/pages/home.page.dart';
import 'package:day_6/pages/phone.page.dart';
import 'package:flutter/material.dart';

class MasterPage extends StatefulWidget {
  MasterPage({super.key});

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  var currentIndex = 0;
  var pages = [
    const HomePage(),
    const PhonePage(),
    const CameraPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.red,
          elevation: 0,
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
          selectedFontSize: 20,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Icon(Icons.phone),
                label: 'Phone'),
            BottomNavigationBarItem(
                backgroundColor: Colors.green,
                icon: Icon(Icons.camera),
                label: 'Camera'),
          ]),
    );
  }
}
