import 'package:flutter/material.dart';
import 'package:movie_app/apis/api_manager.dart';
import 'package:movie_app/screens/searchWidget/search_item.dart';

class SearchMovie extends SearchDelegate{
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
     appBarTheme: AppBarTheme(backgroundColor: Color(0xFF514F4F,),
     elevation: 0),
    );
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: (Icon(
            Icons.search,
            color: Colors.black,
          )))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return  IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: (Icon(
          Icons.clear,
          color: Colors.black,
        ))) ;
  }

  @override
  Widget buildResults(BuildContext context) {
    return  FutureBuilder(
      future:
      ApiManager.getSearchData(search_key_word: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('error');
        }
        var resultsSearch=snapshot.data?.results??[];
        return ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
          itemBuilder: (context, index) {
            return ItemSearch(searchResult:resultsSearch[index] );
          },
          itemCount: resultsSearch.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child:Image.asset('assets/images/search.png')
    );

  }
  
}