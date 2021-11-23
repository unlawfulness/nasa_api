
import 'package:flutter/material.dart';
import 'package:nasa_api/screens/image_preview.dart';

class ControllerNasa{

  var data;
  BuildContext context;

  ControllerNasa(this.data, this.context);

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
                overlayColor: MaterialStateProperty.resolveWith<Color?>((
                    states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.tealAccent;
                  } // <-- Splash color
                }),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ImagePriview(
                          imageURL: dat['url'], title: dat['title'],),
                  ),
                );
              },
              child: Column(
                children: [
                  Image.network(dat['url'],
                  ),
                  Text(dat['date']),
                  Text(dat['title']),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(8.0),),
          ],);

        elements.add(elem);
      }
    } else elements.add(Text('Not find!'));
    return elements;
  }
  }