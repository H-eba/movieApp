class WatchedListItemModel {
  String? id;
  String? title;
  String? originalTitle;
  String? date;
  String? image;

  WatchedListItemModel({this.id = '', this.title, this.date, this.image,this.originalTitle});

  WatchedListItemModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            title: json['title'],
            date: json['date'],
            image: json['image'],
      originalTitle:json['originalTitle']
  );


  Map<String, dynamic> toJason() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'image': image,
      'originalTitle':originalTitle
    };
  }
}
