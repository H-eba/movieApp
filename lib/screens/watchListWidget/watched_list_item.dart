import 'package:flutter/cupertino.dart';

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
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(item.image??'',
                width: 150,
                height: 150,),
            ),
          ),
          Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(item.title??'',style: TextStyle(color: CupertinoColors.white,
                fontSize: 25),),
            Text(item.date??'',style: TextStyle(color: CupertinoColors.white,
                fontSize: 25),),
              Text(item.originalTitle??'',style: TextStyle(color: CupertinoColors.white,
                  fontSize: 25),),

          ],)

        ],
      ),
    );
  }
}
