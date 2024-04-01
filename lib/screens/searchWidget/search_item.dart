import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/SearchResponse.dart';

class SearchItem extends StatelessWidget {
  Results result;
  SearchItem({required this.result, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(25),
              child: Image.network('https://image.tmdb.org/t/p/w500${result.backdropPath??''}',
               width: 150,
               height: 150,),
            ),
            SizedBox(width: 15,),
            Column(
              children: [
        
                Text(
                  result.originalTitle?? '',
                  style: TextStyle(color: CupertinoColors.white, fontSize: 15),
                ),
                Text(
                  result.releaseDate?? '',
                  style: TextStyle(color: CupertinoColors.white, fontSize: 15),
                ),
                Text(
                  result.originalTitle?? '',
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
