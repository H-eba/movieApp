import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/firebase/firebase_function.dart';

import '../../firebase/item_model.dart';

class WatchedListItem extends StatelessWidget {
  WatchedListItemModel item;
  WatchedListItem({required this.item,super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(item.image??'',
                  width: 150,
                  height: 200,
                  fit: BoxFit.fill,),
              ),
              Align(alignment: Alignment.topLeft,
                child: InkWell(onTap: (){
                  FirebaseFunction.deleteItem(item.id??'');
                },
                    child: Image.asset('assets/images/delete_bookmark.png')),
              )
            ],)
          ),
          Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(item.title??'',style: TextStyle(color: CupertinoColors.white,
                fontSize: 15),),
            Text(item.date??'',style: TextStyle(color: CupertinoColors.white,
                fontSize: 15),),
              Text(item.originalTitle??'',style: TextStyle(color: CupertinoColors.white,
                  fontSize: 15),),

          ],)

        ],
      ),
    );
  }
}
