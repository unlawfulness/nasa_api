// ignore_for_file: avoid_print, must_call_super, file_names
//фф

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nasa_api/api/picsum_api.dart';
import 'package:nasa_api/controllers/controllerPicsum.dart';
import 'package:nasa_api/models/picsum_image.dart';

class PicsumPage extends StatefulWidget {
  const PicsumPage({Key? key}) : super(key: key);

  @override
  State<PicsumPage> createState() => _PicsumPage();
}

class _PicsumPage extends State<PicsumPage> {
  
  final _title = 'Image from Lorem Picsum';
  final List<Widget> _imageFromAPI = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PicsumImage>>(
        future: PicsumApi.getPicsumImage(context),
        builder: (context, snapshot) {
          final picsumImages = snapshot.data;
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
                var controller = ControllerPicsum(picsumImages!, context);
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
