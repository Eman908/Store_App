class LaptopModel {
  final String productId;
  final String productStatus;
  final String productCategory;
  final String productName;
  final num productPrice;
  final String productImage;
  final String producrDescription;

  LaptopModel({
    required this.productCategory,
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productStatus,
    required this.producrDescription,
  });

  factory LaptopModel.fromJson(Map<String, dynamic> json) {
    return LaptopModel(
      productCategory: json["category"],
      productId: json["_id"],
      productImage: json["image"],
      productName: json["name"],
      productPrice: json["price"],
      productStatus: json["status"],
      producrDescription: json["description"],
    );
  }
}
