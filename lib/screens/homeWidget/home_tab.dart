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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Enjoy watching',
        style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopSideSection(),
            const SizedBox(
              height: 20,
            ),
            NewReleasesWidget(),
            const SizedBox(
              height: 15,
            ),
            const  RecomendedWidget(),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
