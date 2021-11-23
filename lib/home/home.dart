// ignore_for_file: avoid_print, must_call_super
//фф
import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_api/screens/image_preview.dart';
import 'package:nasa_api/screens/picsumPage.dart';

import 'nasaPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Widget> _imageFromAPI = [];

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {

    String _title = 'Image from NASA API';

    List<Widget> _widgetList = [
      PicsumPage(),
      NasaPage(),
    ];

    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blueAccent,
          items: <Widget>[
            Icon(Icons.filter_sharp, size: 30),
            Icon(Icons.star_outlined, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
      body: _widgetList.elementAt(_page)
    );
  }
}
