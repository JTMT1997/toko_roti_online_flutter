class Transaction {
  final int? id;
  final int productId;
  final String productName;
  final int price;
  final String date;

  Transaction({
    this.id,
    required this.productId,
    required this.productName,
    required this.price,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'price': price,
      'date': date,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      productId: map['productId'],
      productName: map['productName'],
      price: map['price'],
      date: map['date'],
    );
  }
}
