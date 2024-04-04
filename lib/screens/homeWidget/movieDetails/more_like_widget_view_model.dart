import 'package:flutter/material.dart';
import 'package:movie_app/models/Results.dart';
import 'package:movie_app/models/SimilarResponse.dart';

import '../../../apis/api_manager.dart';

class MoreLikeWidgetViewModel extends ChangeNotifier {
  String? errorMessage;
  List<Result>? movies ;
  int? id;
  void getSimilarMovie({required int id}) async {
    movies =null;
    errorMessage =null;
    notifyListeners();
    try{
      var response =await ApiManager.getSimilarMovie(id);
      if(response.results == null){
        errorMessage = 'Error Loading ... ';
      }else {
        movies = response.results;
      }
    }catch(error){
      errorMessage = 'Error Loading ... \n ${error}';
    }
    notifyListeners();
  }
}
