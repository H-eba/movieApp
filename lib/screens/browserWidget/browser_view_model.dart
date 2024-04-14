import 'package:flutter/material.dart';
import 'package:movie_app/apis/api_manager.dart';
import 'package:movie_app/models/Genres.dart';

class BrowserViewModel extends ChangeNotifier{
  List<Genres>? movies ;
  String? errorMessage;
  void getMovieList()async{
    movies =null;
    errorMessage =null;
    notifyListeners();
    try{
      var response =await ApiManager.getMovieList();
      if(response.genres == null){
        errorMessage ='Error Loading ...';
      }else {
        movies = response.genres;
      }
    }catch(error){
      errorMessage = 'Error Loading ... \n ${error}';
    }
    notifyListeners();
  }
}