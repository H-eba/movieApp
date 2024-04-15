class WatchedListItemModel {
  String? id;
  String? title;
  String? originalTitle;
  String? date;
  String? image;
  bool ? mark;

  WatchedListItemModel({this.id = '', this.title, this.date, this.image,this.originalTitle,
  this.mark=true});

  WatchedListItemModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            title: json['title'],
            date: json['date'],
            image: json['image'],
      mark:json['mark'],
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
