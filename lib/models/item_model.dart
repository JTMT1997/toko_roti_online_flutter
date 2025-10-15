class Item {
  final int? id;
  final String title;
  final String description;

  final String imagePath;

  Item({this.id, required this.title, required this.description,  required this.imagePath});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,

      'description': description,
      'imagePath': imagePath,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      imagePath: map['imagePath'],
    );
  }





  
}
