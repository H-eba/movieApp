import 'package:flutter/material.dart';
import 'package:movie_app/models/Results.dart';
import 'package:movie_app/screens/homeWidget/movieDetails/movie_details_screen.dart';

class CustomeWidget extends StatefulWidget {
  List<Result>? movies;
   CustomeWidget({super.key,required this.movies});

  @override
  State<CustomeWidget> createState() => _CustomeWidgetState();
}

class _CustomeWidgetState extends State<CustomeWidget> {
  bool isChacked = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: widget.movies!.length,
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              Container(
                  decoration: new BoxDecoration(color: Colors.white),
                  alignment: Alignment.center,
                  height: double.infinity,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, MovieDetailsScreen.routeName);
                    },
                    child: Image.network(
                        'https://image.tmdb.org/t/p/w500/${widget.movies![index].posterPath ?? ''}',
                        fit: BoxFit.fill),
                  )),
              Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    child: isChacked
                        ? Image(
                        image: AssetImage(
                            'assets/images/checked_bookmark_icon.png'))
                        : Image(
                        image: AssetImage(
                            'assets/images/bookmark_icon.png')),
                    onTap: () {
                      // TODO : add to Watchlist
                      isChacked = true;
                      setState(() {});
                    },
                  ))
            ],
          );
        },
      ),
    );
  }
}
