import 'package:flutter/material.dart';

import '../../../apis/api_manager.dart';
import '../../../models/DetailsResponse.dart';

class MovieDetailsViewModel extends ChangeNotifier{
  String? errorMessage;
  DetailsResponse? movieDetails;
  int? id;
  void getMovieDetails({required int id})async{
    try{
      var response =await ApiManager.getMovieDetails(id);
      if(response.id == null){
        errorMessage = 'There is error in loading';
      }else {
        movieDetails = response;
      }
    }catch(error){
      errorMessage = 'Error Loading ... \n ${error}';
    }
    notifyListeners();
  }
}