// ignore_for_file: avoid_print, must_call_super, file_names
//фф

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nasa_api/api/nasa_api.dart';
import 'package:nasa_api/controllers/controllerNASA.dart';
import 'package:nasa_api/models/nasa_image.dart';

class NasaPage extends StatefulWidget {
  const NasaPage({Key? key}) : super(key: key);

  @override
  State<NasaPage> createState() => _NasaPageState();
}

class _NasaPageState extends State<NasaPage> {
  final _title = 'Image from NASA API';
  final List<Widget> _imageFromAPI = [];
  //https://api.nasa.gov/planetary/apod?api_key=d1da9Wdg6K081MX0zwVNQZvbMmrpUfsJephBfVbv&count=10

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NasaImage>>(
        future: NasaApi.getNasaImage(context),
        builder: (context, snapshot) {
          final nasaImages = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Sorry, something wrong'),
                );
              } else {
                var controller = ControllerNasa(nasaImages!, context);
                _imageFromAPI.clear();
                _imageFromAPI.addAll(controller.getElements());
                return buildImageScrollList();
              }
          }
        });
  }

  Widget buildImageScrollList() {
    return RefreshIndicator(
        onRefresh: () {
          build(context);  
          return Future.delayed(const Duration(seconds: 0));
        },
        child:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          SliverAppBar(
            title: Text(_title),
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
