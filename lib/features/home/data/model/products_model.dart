class ProductsModel {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final RatingModel ratingModel;

  ProductsModel(
      {required this.category,
      required this.description,
      required this.id,
      required this.image,
      required this.price,
      required this.title,
      required this.ratingModel});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
        category: json["category"],
        description: json["description"],
        id: json["id"],
        image: json["image"],
        price: json["price"],
        title: json["title"],
        ratingModel: RatingModel.fromJson(json["rating"]));
  }
}

class RatingModel {
  final num rate;
  final num count;

  RatingModel({required this.count, required this.rate});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(count: json["count"], rate: json["rate"]);
  }
}
