import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

class ImagePriview extends StatelessWidget {

  final String imageURL;
  final String title;

  const ImagePriview({Key? key, required this.imageURL, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Image.network(imageURL),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.download),
        onPressed: () async {
          try {
            // Saved with this method.
            var imageId = await ImageDownloader.downloadImage(imageURL);
            if (imageId == null) {
              return;
            }

            // Below is a method of obtaining saved image information.
            var fileName = await ImageDownloader.findName(imageId);
            var path = await ImageDownloader.findPath(imageId);
            var size = await ImageDownloader.findByteSize(imageId);
            var mimeType = await ImageDownloader.findMimeType(imageId);
          } on PlatformException catch (error) {
            print(error);
          }
        },
      ),
    );
  }
}
