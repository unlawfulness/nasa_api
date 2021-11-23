
import 'package:flutter/material.dart';
import 'package:nasa_api/home/home.dart';
import 'package:nasa_api/home/nasaPage.dart';
import 'package:nasa_api/screens/picsumPage.dart';
//import 'package:nasa_api/screens/image_preview.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.grey,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const Home(),
      '/picsumPage': (context) => PicsumPage(),
      '/nasaPage': (context) => NasaPage(),
    },
  ));
}