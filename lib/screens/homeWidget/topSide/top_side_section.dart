import 'package:flutter/material.dart';
import 'package:movie_app/apis/api_manager.dart';
import 'package:movie_app/models/Popular_response.dart';
import 'package:movie_app/my_theme_data.dart';
import 'package:movie_app/screens/homeWidget/topSide/slider-widget.dart';

class TopSideSection extends StatefulWidget {

  TopSideSection({super.key});

  @override
  State<TopSideSection> createState() => _TopSideSectionState();
}

class _TopSideSectionState extends State<TopSideSection> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PopularResponse>(
      future: ApiManager.getTopSide(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: MyThemeData.yellowColor,
            ),
          );
        } else if (snapshot.hasError || snapshot.data!.page == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Something wrong !!!!',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    ApiManager.getTopSide();
                    setState(() {});
                  },
                  child: Text(
                    'Tray again',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          );
        } else {
          var results = snapshot.data!.results ?? [];

          return Expanded(
            child: PageView.builder(
                itemCount: results.length,
                pageSnapping: true,
                itemBuilder: (context,index){
                  return Container(
                      margin: EdgeInsets.all(10),
                      child: SliderWidget(results: results,index: index,)
                  );
                }),
          );
        }
      },
    );
  }
}
