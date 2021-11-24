// ignore_for_file: avoid_print, must_call_super
//фф

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nasa_api/screens/picsumPage.dart';

import '../screens/nasaPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _page = 0;

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _widgetList = [
      const PicsumPage(),
      const NasaPage(),
    ];

    return Scaffold(
      extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.blue.shade200,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.blue.shade200,
          items: const <Widget>[
            Icon(Icons.filter_sharp, size: 30),
            Icon(Icons.star_outlined, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          animationDuration: const Duration(milliseconds: 400),
          height: 60.0,
        ),
      body: _widgetList.elementAt(_page)
    );
  }
}
