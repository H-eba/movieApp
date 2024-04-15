import 'package:flutter/material.dart';
import 'package:movie_app/models/Genres.dart';
import 'package:movie_app/screens/browserWidget/movie_details.dart';


class CategoryWidget extends StatelessWidget {
 //String? category;
 // int? index ;
 String img ;
 String category;
 List<Genres> ? movie;
  CategoryWidget(this.category,   this.img,{this.movie,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
     Navigator.pushNamed(context, MovieDetails.routName,arguments: movie);
      },
      child: Container(
        margin: EdgeInsets.only(left: 12,right: 12),
        height: MediaQuery.of(context).size.width*0.1,
        width: MediaQuery.of(context).size.width*0.1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('$img',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width*1,
              height: MediaQuery.of(context).size.height*0.8,
              colorBlendMode: BlendMode.darken,
              color: Colors.grey,
            ),
            Text('${category}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
