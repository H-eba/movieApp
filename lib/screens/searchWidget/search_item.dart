import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/homeWidget/movieDetails/movie_details_screen.dart';

import '../../models/SearchResponce.dart';

class ItemSearch extends StatelessWidget {
  SearchResults searchResult;
   ItemSearch({ required this.searchResult,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(15),
              child: Image.network('https://image.tmdb.org/t/p/w500${searchResult.backdropPath??''}',
                width: 150,
                height: 70,
              fit: BoxFit.fill,),
            ),
            SizedBox(width: 15,),
            InkWell(
              onTap: () =>  Navigator.pushNamed(context, MovieDetailsScreen.routeName ,
                  arguments: {
                    'id': searchResult.id,
                  }) ,
              child: Column(
                children: [

                  Text(
                    searchResult.originalTitle?? '',
                    style: TextStyle(color: CupertinoColors.white, fontSize: 15),
                  ),
                  Text(
                    searchResult.releaseDate?? '',
                    style: TextStyle(color: CupertinoColors.white, fontSize: 15),
                  ),
                  Text(
                    searchResult.originalTitle?? '',
                    style: TextStyle(color: CupertinoColors.white, fontSize: 15),
                  ),
                ],
              ),
            ),


            // Image.network(result.)
          ],
        ),
      ),
    );
  }
}
