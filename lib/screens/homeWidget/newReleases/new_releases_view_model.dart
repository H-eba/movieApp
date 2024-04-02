import 'package:flutter/material.dart';
import 'package:movie_app/apis/api_manager.dart';
import 'package:movie_app/models/Results.dart';

class NewReleasesViewModel extends ChangeNotifier{
  List<Result>? movies ;
  String? errorMessage;
  void getNewReleases()async{
    movies =null;
    errorMessage =null;
    notifyListeners();
    try{
      var response =await ApiManager.getNewReleases();
      if(response.results == null){
        errorMessage = response!.statusMessage;
      }else {
        movies = response.results;
      }
    }catch(error){
      errorMessage = 'Error Loading ... \n ${error}';
    }
    notifyListeners();
  }
}