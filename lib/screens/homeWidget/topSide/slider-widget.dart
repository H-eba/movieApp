import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../models/Results.dart';

class SliderWidget extends StatelessWidget {
  Result results;
  SliderWidget({super.key, required this.results,});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Image(
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500/${results?.backdropPath ?? ''}')),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      results?.title ??
                          ''.substring(
                              0, min(20, results.title!.length)) ??
                          '',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          ),
                    ),
                    Text(
                      results?.releaseDate ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xffB5B4B4),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Image(
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500/${results?.posterPath ?? ''}',
                        ),
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    ),
            )
          ],
        ));
  }
}
