
import 'package:flutter/material.dart';
import 'package:nasa_api/models/home.dart';
import 'package:nasa_api/screens/nasaPage.dart';
import 'package:nasa_api/screens/picsumPage.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.grey,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const Home(),
      '/picsumPage': (context) => const PicsumPage(),
      '/nasaPage': (context) => const NasaPage(),
    },
  ));
}