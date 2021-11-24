
import 'package:flutter/material.dart';
import 'package:nasa_api/home/home.dart';
import 'package:nasa_api/home/nasaPage.dart';
import 'package:nasa_api/home/picsumPage.dart';

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