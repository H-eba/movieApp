import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/watchListWidget/watched_list_item.dart';

import '../../firebase/firebase_function.dart';
import '../../firebase/item_model.dart';
import '../../models/Results.dart';


class WatchedListTab extends StatelessWidget {
  Result? result;
   WatchedListTab({ this.result,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      child:StreamBuilder<QuerySnapshot<WatchedListItemModel>>(
          stream: FirebaseFunction.getItem(),
          builder: (context,snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            }
            if (snapshot.hasError) {
              return Column(children: [
                Text('somthing is wrong')
              ],);
            }
            var items = snapshot.data!.docs.map((e) => e.data()).toList() ??
                [];
            if(items.isEmpty){
              return Center(child: Text('no tasks',style: TextStyle(fontSize: 20),));
            }
            return ListView.separated(itemBuilder: (context, index) {
              return WatchedListItem(item:items[index] );
            },
                itemCount: items.length,
            separatorBuilder: (context, index) {
              return Container(color: Colors.grey,
                width: double.infinity,height: 1.5,);
            },);
          }
      ),
    );
  }
}
