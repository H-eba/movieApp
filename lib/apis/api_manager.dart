import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/Popular_response.dart';

class ApiManager {
  static const String baseUri = 'api.themoviedb.org';
  static const String topEndPoint = '/3/movie/popular';
  static const String apiKey = '7cd714cc8f1c493e940cf196274592e2';

  static Future<PopularResponse> getTopSide() async{
    // https://api.themoviedb.org/3/movie/popular?language=en-US&page=1
    Uri url = Uri.https(
        baseUri, topEndPoint,
        {
          'api_key':apiKey,
          'language': 'en-US',
          });
   try {
      var response = await http.get(url);
      var responseBody = response.body; // string
      var json = jsonDecode(responseBody); // string => json
      return PopularResponse.fromJson(json);
    }catch(error){
     throw(error);
   }
  }
}
