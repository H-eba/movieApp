import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../models/Results.dart';

class SliderWidget extends StatelessWidget {
  List<Result> results;
  int index;
  SliderWidget({super.key, required this.results, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
            image: NetworkImage(
                'https://image.tmdb.org/t/p/w500/${results?[index].backdropPath ?? ''}')),
        Container(
          margin: EdgeInsets.symmetric(vertical: 90, horizontal: 10),
          child: Row(
            children: [
              Image(
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/${results?[index].posterPath ?? ''}',
                ),
                height: MediaQuery.of(context).size.height*0.25,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Text(
                    textAlign: TextAlign.justify,
                    maxLines: null,
                   results?[index].originalTitle ?? '',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    results?[index].releaseDate ?? '',
                    style: TextStyle(fontSize: 10, color: Color(0xffB5B4B4)),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
