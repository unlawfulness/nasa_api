import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:nasa_api/models/nasa_image.dart';

class NasaApi{
  static Future<List<NasaImage>> getNasaImage(BuildContext context) async {

    const apiURL = 'https://api.nasa.gov/planetary/apod?api_key=d1da9Wdg6K081MX0zwVNQZvbMmrpUfsJephBfVbv&count=30'; 
    var url = Uri.parse(apiURL);
    var response = await http.get(url);
    final body = json.decode(response.body);

    return body.map<NasaImage>(NasaImage.fromJson).toList();

  }
}