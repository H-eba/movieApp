import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/browserWidget/movie_details.dart';
import 'package:movie_app/screens/homeWidget/movieDetails/movie_details_screen.dart';

import '../../models/CategoryResponse.dart';

class CategoryItem extends StatelessWidget {
  CategoryList categoryItem;
  CategoryItem({required this.categoryItem,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:InkWell(
          onTap:() => Navigator.pushNamed(context, MovieDetailsScreen.routeName ,
              arguments: {
                'id': categoryItem.id,
              }) ,
          child: Column(
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(15),
                child: Image.network('https://image.tmdb.org/t/p/w500${categoryItem.backdropPath??''}',
                  width: 150,
                  height: 100,
                  fit: BoxFit.fill,),
              ),
              Text('${categoryItem?.originalTitle ??''}',style: TextStyle(fontSize: 18,color: Colors.white),)



              // Image.network(result.)
            ],
          ),
        ),
      ),
    );
  }
}
