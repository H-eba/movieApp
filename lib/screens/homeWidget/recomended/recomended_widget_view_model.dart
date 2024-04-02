import 'package:flutter/material.dart';
import 'package:movie_app/models/Results.dart';

import '../../../apis/api_manager.dart';

class RecomendedWidgetViewModel extends ChangeNotifier{
  List<Result>? movies ;
  String? errorMessage;
  void getRecomended()async{
    movies =null;
    errorMessage =null;
    notifyListeners();
    try{
      var response =await ApiManager.getTopRated();
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