import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/Popular_response.dart';
import 'package:movie_app/models/TopRatedResponse.dart';
import 'package:movie_app/models/Upcoming_response.dart';

import '../models/SearchResponce.dart';

class ApiManager {
  static const String baseUri = 'api.themoviedb.org';
  static const String apiKey = '7cd714cc8f1c493e940cf196274592e2';

  static Future<PopularResponse> getTopSide() async{
    // https://api.themoviedb.org/3/movie/popular?language=en-US&page=1
    Uri url = Uri.https(
        baseUri, '/3/movie/popular',
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

  //https://api.themoviedb.org/3/movie/upcoming?api_key=7cd714cc8f1c493e940cf196274592e2

  static Future<UpcomingResponse> getNewReleases() async{
    Uri url = Uri.https(
        baseUri, '/3/movie/upcoming',
        {
          'api_key':apiKey,
          'language': 'en-US',
        });
    try {
      var response = await http.get(url);
      var responseBody = response.body; // string
      var json = jsonDecode(responseBody); // string => json
      return UpcomingResponse.fromJson(json);
    }catch(error){
      throw(error);
    }
  }

  //https://api.themoviedb.org/3/movie/top_rated?api_key=7cd714cc8f1c493e940cf196274592e2
static Future<TopRatedResponse> getTopRated() async{
  Uri url = Uri.https(
      baseUri, '/3/movie/top_rated',
      {
        'api_key':apiKey,
        'language': 'en-US',
      });
  try {
    var response = await http.get(url);
    var responseBody = response.body; // string
    var json = jsonDecode(responseBody); // string => json
    return TopRatedResponse.fromJson(json);
  }catch(error){
    throw(error);
  }
}


  static Future<SearchResponce>getSearchData({ String?search_key_word })async{
    Uri url=Uri.https(baseUri,'/3/search/movie',{
      'query':search_key_word,
    });
    http.Response response = await http.get(url,
        headers:{'Authorization':'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MzIxZGVhZDU2NmVhZjkzOTk0ZTk2YjBkM2FjNDkwZCIsInN1YiI6IjYzZTUxZWY0MmUyYjJjMDBjYjdlZmI2ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Irm44wksKGP7J5auFnBOhXBNC9Dkj7C3_jf7le-U2rI'}
    );
    var jason=jsonDecode(response.body);
    return SearchResponce.fromJson(jason);

  }
}
