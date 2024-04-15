import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/CategoryResponse.dart';
import 'package:movie_app/screens/browserWidget/category_item.dart';

import '../../apis/api_manager.dart';
import '../../models/Genres.dart';
class MovieDetails extends StatelessWidget {


  static const String routName='movie details';
 // Genres? movie;
  const MovieDetails({ super.key});

  @override
  Widget build(BuildContext context) {
    //var movie=ModalRoute.of(context)!.settings.arguments as Genres;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme:const IconThemeData(
          color: Colors.white
        ),
        centerTitle: true,
        title:const Text('MovieDetails',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
        ),
      body:FutureBuilder(
        future:
        ApiManager.getCategoryDetailsList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Text('error');
          }
          var categoryDetails=snapshot.data?.results??[];
          return GridView.builder(gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder:(context, index) {
              return CategoryItem(categoryItem: categoryDetails[index]);
            },
            itemCount: categoryDetails.length,);
        },
      ) ,
    );
     /*FutureBuilder(
      future:
      ApiManager.getCategoryDetailsList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('error');
        }
        var categoryDetails=snapshot.data?.results??[];
        return GridView.builder(gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder:(context, index) {
              return CategoryItem(categoryItem: categoryDetails[index]);
            },
        itemCount: categoryDetails.length,);
      },
    );*/
  }
}
