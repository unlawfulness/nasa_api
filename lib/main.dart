
import 'package:flutter/material.dart';
import 'package:nasa_api/screens/home.dart';
import 'package:nasa_api/screens/image_preview.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.grey,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      //'/image_priview': (context) => ImagePriview(),
    },
  ));
}