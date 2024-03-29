import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/browserWidget/browser_tab.dart';
import 'package:movie_app/screens/homeWidget/home_tab.dart';
import 'package:movie_app/screens/searchWidget/search_tab.dart';
import 'package:movie_app/screens/watchListWidget/watched_list_tab.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home screen';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Color(0xff121312),
      decoration: BoxDecoration(
       color: Color(0xff121312),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTabIndex,
          onTap: (index) {
            selectedTabIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Color(0xff1A1A1A),
                icon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                backgroundColor: Color(0xff1A1A1A),
                icon: Icon(Icons.search),
                label: 'Search'),
            BottomNavigationBarItem(
                icon:Icon(Icons.movie),
                label: 'Browser'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmarks),
                label: 'Watched List'),
          ],
        ),
        body: tabs[selectedTabIndex],
      ),
    );
  }
}
var tabs=[
  HomeTab(),
  SearchTab(),
  BrowserTab(),
  WatchedListTab()
];
