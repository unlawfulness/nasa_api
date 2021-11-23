// ignore_for_file: avoid_print, must_call_super
//фф
import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_api/controllers/controllerNASA.dart';
import 'package:nasa_api/models/model.dart';
import 'package:nasa_api/screens/image_preview.dart';

class NasaPage extends StatefulWidget {
  const NasaPage({Key? key}) : super(key: key);

  @override
  State<NasaPage> createState() => _NasaPageState();
}

class _NasaPageState extends State<NasaPage> {

  final List<Widget> _imageFromAPI = [];

  void getDataFromAPI() {
    var model = Model('https://api.nasa.gov/planetary/apod?api_key=d1da9Wdg6K081MX0zwVNQZvbMmrpUfsJephBfVbv&count=30');
    var controller = ControllerNasa(model.getDataFromApi(), context);
    _imageFromAPI.addAll(controller.getElements());


    // var url = Uri.parse('https://api.nasa.gov/planetary/apod?api_key=d1da9Wdg6K081MX0zwVNQZvbMmrpUfsJephBfVbv&count=10');
    // var response = await http.get(url);
    // // print('Response status: ${response.statusCode}');
    // // print('Response body: ${response.body}');
    //
    // if (response.statusCode == 200) {
    //   var data = json.decode(response.body);
    //
    //   _imageFromAPI.clear();
    //
    //   for (var dat in data) {
    //     Widget elem = Column(
    //       children: [
    //         ElevatedButton(
    //           style: ButtonStyle(
    //             //shape: MaterialStateProperty.all(),
    //             padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
    //             backgroundColor: MaterialStateProperty.all(Colors.blue),
    //             // <-- Button color
    //             overlayColor: MaterialStateProperty.resolveWith<Color?>((
    //                 states) {
    //               if (states.contains(MaterialState.pressed)) {
    //                 return Colors.tealAccent;
    //               } // <-- Splash color
    //             }),
    //           ),
    //           onPressed: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) => ImagePriview(imageURL: dat['url'], title: dat['title'],),
    //               ),
    //             );
    //           },
    //           child: Column(
    //             children: [
    //               Image.network(dat['url'],
    //               ),
    //               Text(dat['date']),
    //               Text(dat['title']),
    //             ],
    //           ),
    //         ),
    //         const Padding(padding: EdgeInsets.all(8.0),),
    //       ],);
    //
    //     _imageFromAPI.add(elem);
    //   }
    // }else {
    //   print('ERROR');
    //   print('Response status: ${response.statusCode}');
    //   print('Response body: ${response.body}');
    // }
    //
    // //https://api.nasa.gov/planetary/apod?api_key=d1da9Wdg6K081MX0zwVNQZvbMmrpUfsJephBfVbv&count=10
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
