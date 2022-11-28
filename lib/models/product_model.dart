import 'package:althouraya/models/review_model.dart';

class ProductModel {
  String title, image, price;
  List<ReviewModel> ratings;

  ProductModel({
    required this.title,
    required this.image,
    required this.price,
    required this.ratings,
  });
}
