import 'package:flutter/material.dart';
import 'package:movie_app/firebase/firebase_function.dart';
import 'package:movie_app/firebase/item_model.dart';
import 'package:movie_app/models/Results.dart';
import 'package:movie_app/screens/homeWidget/movieDetails/movie_details_screen.dart';

class CustomeWidget extends StatefulWidget {
  String title;
  List<Result>? movies;
  Result? result;
  CustomeWidget(
      {super.key, required this.movies, required this.title, this.result});

  @override
  State<CustomeWidget> createState() => _CustomeWidgetState();
}

class _CustomeWidgetState extends State<CustomeWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 300,
        color: Color(0xff514F4F),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: 20,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies!.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, MovieDetailsScreen.routeName,
                            arguments: {
                              'id': widget.movies![index].id,
                            });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${widget.movies![index].posterPath ?? ''}',
                            fit: BoxFit.fill),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          child: widget.movies![index].adult!
                              ? Image(
                                  image: AssetImage(
                                      'assets/images/checked_bookmark_icon.png'))
                              : Image(
                                  image: AssetImage(
                                      'assets/images/bookmark_icon.png')),
                          onTap: () {
                            // TODO : add to Watchlist
                            widget.movies![index].adult = true;
                            WatchedListItemModel item = WatchedListItemModel(
                              image:
                                  'https://image.tmdb.org/t/p/w500/${widget.movies?[index].posterPath ?? ''}',
                              title: widget.movies?[index].title,
                              originalTitle: widget.movies?[index].originalTitle ,
                              date: widget.movies?[index].releaseDate,
                            );
                            FirebaseFunction.addTask(item);
                            setState(() {});
                          },
                        ))
                  ],
                );
              },
            ),
          )
        ]));
  }
}
