import 'package:flutter/material.dart';
import 'package:movie_app/my_theme_data.dart';
import 'package:movie_app/screens/browserWidget/browser_view_model.dart';
import 'package:movie_app/screens/browserWidget/category_widget.dart';
import 'package:provider/provider.dart';

List<String> images = [
  'assets/categories/adventure.jpg',
  'assets/categories/animation.jpg',
  'assets/categories/documentry.jpg',
  'assets/categories/fammily.jpg',
  'assets/categories/sciencefiction.jpg',
  'assets/categories/tvmovie.jpg',
  'assets/categories/Music.png',
  'assets/categories/adventure.jpg',
  'assets/categories/animation.jpg',
  'assets/categories/documentry.jpg',
  'assets/categories/fammily.jpg',
  'assets/categories/sciencefiction.jpg',
  'assets/categories/tvmovie.jpg',
  'assets/categories/Music.png',
  'assets/categories/adventure.jpg',
  'assets/categories/animation.jpg',
  'assets/categories/documentry.jpg',
  'assets/categories/fammily.jpg',
  'assets/categories/sciencefiction.jpg',
  'assets/categories/tvmovie.jpg',
  'assets/categories/Music.png',
  'assets/categories/adventure.jpg',
  'assets/categories/animation.jpg',
  'assets/categories/documentry.jpg',
  'assets/categories/fammily.jpg',
  'assets/categories/sciencefiction.jpg',
  'assets/categories/tvmovie.jpg',
  'assets/categories/Music.png',
];

class BrowserTab extends StatefulWidget {
  const BrowserTab({super.key});

  @override
  State<BrowserTab> createState() => _BrowserTabState();
}

class _BrowserTabState extends State<BrowserTab> {
  BrowserViewModel viewModel =BrowserViewModel();
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    viewModel.getMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<BrowserViewModel>(
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
                  viewModel.getMovieList();
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
      else if (viewModel.movies == null) {
        return Center(
          child: CircularProgressIndicator(
            color: MyThemeData.yellowColor,
          ),
        );
      }
      else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                'Browse Categories',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: viewModel.movies?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 32,
                    crossAxisSpacing: 32,
                  ),
                  itemBuilder: (context, index) =>
                      CategoryWidget(viewModel.movies?[index].name ?? '', images[index])),
            )
          ],
        );
    }
    }
          ),
      ),
    ));
  }
}
