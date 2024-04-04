import 'package:flutter/material.dart';
import 'package:movie_app/my_theme_data.dart';
import 'package:movie_app/screens/homeWidget/movieDetails/more_like_widget_view_model.dart';
import 'package:provider/provider.dart';
import '../custome_widget.dart';

class MoreLikeWidget extends StatefulWidget {
  int? id;
  late var args;

  MoreLikeWidget({super.key,required this.id});

  @override
  State<MoreLikeWidget> createState() => _MoreLikeWidgetState();
}

class _MoreLikeWidgetState extends State<MoreLikeWidget> {
  MoreLikeWidgetViewModel viewModel =MoreLikeWidgetViewModel();

  @override
  Widget build(BuildContext context) {
    widget.args = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    widget.id = widget.args['id'];
    viewModel.getSimilarMovie(id: widget.id ?? 0);

        return ChangeNotifierProvider(
                create: (context) => viewModel,
                child: Consumer<MoreLikeWidgetViewModel>(
                    builder:(context, value, child) {
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
                                  viewModel.getSimilarMovie(id: widget.id??0);
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
                      }else if(viewModel.movies == null) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: MyThemeData.yellowColor,
                          ),
                        );

                      }
                      else{
                        return CustomeWidget(
                            title: 'More Like This',
                            movies: viewModel.movies,
                            );
                      }

                    }
                ),
              );

      }
}



