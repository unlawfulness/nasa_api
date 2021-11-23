import 'dart:convert';

import 'package:http/http.dart' as http;

class Model{

  String apiURL;

  Model(this.apiURL);

  Future getDataFromApi() async {

    var url = Uri.parse(apiURL);
    var response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    var data;
    if (response.statusCode == 200) {
      data = json.decode(response.body);
    }else {
      data = null;
      print('ERROR');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    return data;

    //https://api.nasa.gov/planetary/apod?api_key=d1da9Wdg6K081MX0zwVNQZvbMmrpUfsJephBfVbv&count=10
  }
}