import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:nasa_api/models/picsum_image.dart';

class PicsumApi{
  static Future<List<PicsumImage>> getPicsumImage(BuildContext context) async{

    const apiURL = 'https://picsum.photos/v2/list?page=2&limit=100'; 
    var url = Uri.parse(apiURL);
    var response = await http.get(url);
    final body = json.decode(response.body);

    return body.map<PicsumImage>(PicsumImage.fromJson).toList();

  }
}