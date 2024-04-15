import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/screens/homeWidget/movieDetails/genres_widget.dart';
import 'package:movie_app/screens/homeWidget/movieDetails/more_like_widget.dart';
import 'package:movie_app/screens/homeWidget/movieDetails/movie_details_view_model.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const String routeName = 'Movie Details';
  late int? id ;
  late var args;
  MovieDetailsScreen({super.key, this.id});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieDetailsViewModel viewModel = MovieDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    widget.args = (ModalRoute
        .of(context)
        ?.settings
        .arguments ?? <String, dynamic>{}) as Map;
    widget.id = widget.args['id'];
    viewModel.getMovieDetails(id: widget.id ?? 0);

    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<MovieDetailsViewModel>(
            builder: (context, value, child) {
              if (viewModel.errorMessage != null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        viewModel.errorMessage!,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          viewModel.getMovieDetails(id: widget.id ?? 0);
                          setState(() {});
                        },
                        child: Text(
                          'Tray again',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                );
              }
              else if (viewModel.movieDetails == null) {
                return Center(
                  child: CircularProgressIndicator(
                  ),
                );
              }
              else {
                return Scaffold(
                    appBar: AppBar(
                      centerTitle: true,
                      iconTheme: IconThemeData(color: Colors.white),
                      title: Text(
                        viewModel.movieDetails?.originalTitle ?? '',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    body:
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500/${viewModel
                                        .movieDetails!.backdropPath}'),
                              ),
                              Icon(Icons.play_circle,size: 60,color: Color(0xB6F5F5F5),)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 15),
                            child: Text(
                              viewModel.movieDetails?.originalTitle ?? '',
                              style: TextStyle(color: Colors.white,
                                  fontSize: 22),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3, left: 15),
                            child: Text(
                              viewModel.movieDetails?.releaseDate ?? '',
                              style: TextStyle(
                                color: Color(0xffB5B4B4),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 15),
                            child: Row(
                              children: [
                                Image(
                                  height: 200,
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500/${viewModel
                                          .movieDetails!.posterPath}'),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 10),
                                          height: 40,
                                          child: ListView.separated(
                                            separatorBuilder: (context,
                                                index) => SizedBox(width: 12,),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: viewModel.movieDetails
                                                ?.genres?.length ?? 0,
                                            itemBuilder: (context, index) {
                                              return GenresWidget(
                                                  movieType: viewModel
                                                      .movieDetails
                                                      ?.genres?[index].name);
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0),
                                          child: Text(
                                            viewModel.movieDetails?.overview ??
                                                '',
                                            style: TextStyle(
                                                color: Colors.white),
                                            maxLines: 5,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star_rounded,
                                              color: Color(0xffFFBB3B),
                                              size: 50,
                                            ),
                                            Text(
                                              '${viewModel.movieDetails
                                                  ?.voteAverage ?? 0.0}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          MoreLikeWidget(id: widget.id,),
                        ],
                      ),
                    )
                );
              }
            }
        ));
  }
}
