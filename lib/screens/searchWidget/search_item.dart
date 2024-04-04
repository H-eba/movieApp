import 'package:flutter/cupertino.dart';

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
            ClipRRect(borderRadius: BorderRadius.circular(25),
              child: Image.network('https://image.tmdb.org/t/p/w500${searchResult.backdropPath??''}',
                width: 150,
                height: 150,),
            ),
            SizedBox(width: 15,),
            Column(
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


            // Image.network(result.)
          ],
        ),
      ),
    );
  }
}
