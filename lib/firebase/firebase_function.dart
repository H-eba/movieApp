

import 'package:cloud_firestore/cloud_firestore.dart';

import 'item_model.dart';

class FirebaseFunction {
  static CollectionReference<WatchedListItemModel> getCollectionItem() {
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
    var collection = getCollectionItem();
    var docRef = collection.doc();
    itemModel.id = docRef.id;
    return docRef.set(itemModel);
  }
  ///get
  static Stream<QuerySnapshot<WatchedListItemModel>>getItem(){
   return getCollectionItem().snapshots();
  }
  ///delete
  static Future<void> deleteItem(String id) {
    return getCollectionItem().doc(id).delete();
  }

}