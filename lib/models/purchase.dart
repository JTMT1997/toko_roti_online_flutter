class Purchase {
  final int? id;
  final int productId;
  final String productName;
  final int price;
  final String imagePath;

  Purchase({
    this.id,
    required this.productId,
    required this.productName,
    required this.price,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'price': price,
      'imagePath': imagePath,
    };
  }

  factory Purchase.fromMap(Map<String, dynamic> map) {
    return Purchase(
      id: map['id'],
      productId: map['productId'],
      productName: map['productName'],
      price: map['price'],
      imagePath: map['imagePath'],
    );
  }
}
