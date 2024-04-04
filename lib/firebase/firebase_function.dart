

import 'package:cloud_firestore/cloud_firestore.dart';

import 'item_model.dart';

class FirebaseFunction {
  static CollectionReference<WatchedListItemModel> getCollectionTask() {
    return FirebaseFirestore.instance
        .collection('item')
        .withConverter<WatchedListItemModel>(
      fromFirestore: (snapshot, _) {
        return WatchedListItemModel.fromJson(snapshot.data()!);
      },
      toFirestore: (item, _) {
        return item.toJason();
      },
    );
  }
///add
  static Future<void> addTask(WatchedListItemModel itemModel) {
    var collection = getCollectionTask();
    var docRef = collection.doc();
    itemModel.id = docRef.id;
    return docRef.set(itemModel);
  }
  ///get
  static Stream<QuerySnapshot<WatchedListItemModel>>getItem(){
   return getCollectionTask().snapshots();
  }
}