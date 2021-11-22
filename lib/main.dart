
import 'package:flutter/material.dart';
import 'package:nasa_api/screens/home.dart';
//import 'package:nasa_api/screens/image_preview.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.grey,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const Home(),
      //'/image_priview': (context) => ImagePriview(),
    },
  ));
}