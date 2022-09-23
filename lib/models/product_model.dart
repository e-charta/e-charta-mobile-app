class ProductDataModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  ProductDataModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      id: json["productId"],
      title: json["productName"],
      description: json["productDescripton"],
      price: json["productPrice"],
      imageUrl: json["imageUrl"],
    );
  }
}
