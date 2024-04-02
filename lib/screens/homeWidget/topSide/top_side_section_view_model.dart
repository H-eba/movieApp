import 'package:flutter/material.dart';
import 'package:movie_app/apis/api_manager.dart';

import '../../../models/Results.dart';

class TopSideSectionViewModel extends ChangeNotifier{
  List<Result>? results ;
  String? errorMessage;
  void getTopSide()async{
    results =null;
    errorMessage =null;
    notifyListeners();
    try{
      var response =await ApiManager.getTopSide();
      if(response.results == null){
        errorMessage = response!.statusMessage;
      }else {
        results = response.results;
      }
    }catch(error){
      errorMessage = 'Error Loading ... \n ${error}';
    }
    notifyListeners();
  }
}