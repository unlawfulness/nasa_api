// ignore_for_file: curly_braces_in_flow_control_structures, file_names

import 'package:flutter/material.dart';
import 'package:nasa_api/screens/image_preview.dart';

class ControllerPicsum {
  
  dynamic data;
  BuildContext context;

  ControllerPicsum(this.data, this.context);

  List<Widget> getElements() {
    List<Widget> elements = [];

    if (data != null) {
      for (var dat in data) {
        Widget elem = Column(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                //shape: MaterialStateProperty.all(),
                padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.tealAccent;
                  } // <-- Splash color
                }),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImagePriview(
                      imageURL: dat['download_url'],
                      title: dat['author'],
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  Image.network(dat['download_url'], 
                    loadingBuilder:
                      (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  }),
                  Text(dat['author']),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
          ],
        );

        elements.add(elem);
      }
    } else
      elements.add(const Text('Not find!'));
    return elements;
  }
}
