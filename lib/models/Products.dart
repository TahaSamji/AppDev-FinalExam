class Products {
  final String id;
  final String name;
  final double price;
  final String amount;
  final String description;

  Products({
    required this.id,
    required this.name,
    required this.price,
    required this.amount,
    required this.description

  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      name: json['name'] ?? 'Unnamed Product',
      price: (json['price'] ?? 0).toDouble(),
      amount: json['amount'] ?? 'Unnamed amount',
      description: json['description'] ?? 'Unnamed Description',
    );
  }
}