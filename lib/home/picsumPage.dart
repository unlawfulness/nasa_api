// ignore_for_file: avoid_print, must_call_super, file_names
//фф

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nasa_api/controllers/controllerPicsum.dart';
import 'package:nasa_api/models/model.dart';

class PicsumPage extends StatefulWidget {
  const PicsumPage({Key? key}) : super(key: key);

  @override
  State<PicsumPage> createState() => _PicsumPage();
}

class _PicsumPage extends State<PicsumPage> {

  final List<Widget> _imageFromAPI = [];

  void getDataFromAPI() {

    //https://picsum.photos/v2/list?page=2&limit=100
    var model = Model('https://picsum.photos/v2/list?page=2&limit=100');
   
    Future<dynamic> futureData = model.getDataFromApi(); 
    dynamic data;
    Timer(const Duration(milliseconds: 5), () {
      
      futureData.then((value) {
        data = value;
      }, onError: (e) {
        data = null;
      });
      
    });

    var controller = ControllerPicsum(data, context);
    _imageFromAPI.clear();
    _imageFromAPI.addAll(controller.getElements());
    
  }

  @override
  void initState() {
    getDataFromAPI();
  }

  @override
  Widget build(BuildContext context) {

    String _title = 'Image from Lorem Picsum';

    return RefreshIndicator(
            onRefresh: () {
              setState(() {
                getDataFromAPI();
              });
              return Future.delayed(
                  Duration(seconds: 0));
            },
            child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    title: Text(_title),
                    actions: [
                      IconButton(onPressed: (){
                        setState(() {
                          getDataFromAPI();
                        });
                      },
                          icon: const Icon(Icons.autorenew)),
                    ],
                  ),
                  SliverList(
                    delegate:SliverChildListDelegate(
                      [
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: double.infinity,
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: _imageFromAPI,
                          ),
                        ),
                      ],
                    ),
                  )
                ]
            )
        );
  }
}
