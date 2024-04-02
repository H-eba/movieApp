import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/screens/homeWidget/newReleases/new_releases_widget.dart';
import 'package:movie_app/screens/homeWidget/recomended/recomended_widget.dart';
import 'package:movie_app/screens/homeWidget/topSide/top_side_section.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: TopSideSection()),
        SizedBox(
          height: 20,
        ),
        Expanded(child: NewReleasesWidget()),
        SizedBox(
          height: 15,
        ),
        Expanded(child: RecomendedWidget()),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
