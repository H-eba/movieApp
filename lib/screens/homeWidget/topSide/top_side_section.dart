import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/my_theme_data.dart';
import 'package:movie_app/screens/homeWidget/topSide/slider-widget.dart';
import 'package:movie_app/screens/homeWidget/topSide/top_side_section_view_model.dart';
import 'package:provider/provider.dart';

class TopSideSection extends StatefulWidget {
  TopSideSection({super.key});

  @override
  State<TopSideSection> createState() => _TopSideSectionState();
}

class _TopSideSectionState extends State<TopSideSection> {
  TopSideSectionViewModel viewModel = TopSideSectionViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getTopSide();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<TopSideSectionViewModel>(
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
                        viewModel.getTopSide();
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
            else if (viewModel.results == null) {
              return Center(
                child: CircularProgressIndicator(
                  color: MyThemeData.yellowColor,
                ),
              );
            } else {
              return CarouselSlider(
                options: CarouselOptions(
                  height:MediaQuery.of(context).size.height * 0.3,
                  autoPlay: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: viewModel.results!.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: SliderWidget(results: i,),
                      );
                    },
                  );
                }).toList(),
              );
            }
          },
        ));
  }
}
