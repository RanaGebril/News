import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/API_constants.dart';
import 'package:news/SourceResponse.dart';

//contains all methods of api
class ApiManger {
//network request
  //https://newsapi.org/v2/top-headlines/sources?apiKey=b378dc12fefa43f58b1726e3bf2dfb44

  static Future<SourceResponse?> getSources() async {
    Uri url = Uri.https(ApiConstants.baseURL, ApiConstants.endPoint,
        {'apiKey': 'b378dc12fefa43f58b1726e3bf2dfb44'});

    try {
      http.Response response = await http.get(url); //string

      var json = jsonDecode(response.body); //from string to json

      SourceResponse sourceResponse = SourceResponse.fromJson(
          json); //from json to object "SourceResponse"

      return sourceResponse; //object
    }
    catch(e){
      throw e;
    }
  }
}
