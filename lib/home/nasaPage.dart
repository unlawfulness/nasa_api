// ignore_for_file: avoid_print, must_call_super, file_names
//фф

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nasa_api/controllers/controllerNASA.dart';
import 'package:nasa_api/models/model.dart';

class NasaPage extends StatefulWidget {
  const NasaPage({Key? key}) : super(key: key);

  @override
  State<NasaPage> createState() => _NasaPageState();
}

class _NasaPageState extends State<NasaPage> {
  final List<Widget> _imageFromAPI = [];

  void getDataFromAPI() {

    //https://api.nasa.gov/planetary/apod?api_key=d1da9Wdg6K081MX0zwVNQZvbMmrpUfsJephBfVbv&count=10
    var model = Model(
        'https://api.nasa.gov/planetary/apod?api_key=d1da9Wdg6K081MX0zwVNQZvbMmrpUfsJephBfVbv&count=30');

    Future<dynamic> futureData = model.getDataFromApi(); 
    dynamic data;
    Timer(const Duration(milliseconds: 5), () {
      
      futureData.then((value) {
        data = value;
      }, onError: (e) {
        data = null;
      });
      
    });

    var controller = ControllerNasa(data, context);
    _imageFromAPI.clear();
    _imageFromAPI.addAll(controller.getElements());
  }

  @override
  void initState() {
    getDataFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    String _title = 'Image from NASA API';

    return RefreshIndicator(
        onRefresh: () {
          setState(() {
            getDataFromAPI();
          });
          return Future.delayed(const Duration(seconds: 0));
        },
        child:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          SliverAppBar(
            title: Text(_title),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      getDataFromAPI();
                    });
                  },
                  icon: const Icon(Icons.autorenew)),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _imageFromAPI,
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
