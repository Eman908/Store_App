class CartModel {
  final String name;
  final String description;
  final String image;
  final num price;
  final num quantity;
  final num countInStock;
  final String productId;

  CartModel(
      {required this.countInStock,
      required this.description,
      required this.image,
      required this.name,
      required this.price,
      required this.quantity,
      required this.productId});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        countInStock: json["countInStock"],
        description: json["description"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        productId: json["_id"]);
  }
}
