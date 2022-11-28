import 'package:althouraya/infrastructure/request.dart';
import 'package:althouraya/models/user_model.dart';

class ReviewModel extends RentXSerialized {
  UserModel? user;
  String? review;
  double? rating;
  ReviewModel(
      {required this.rating,
      required this.review,
      required this.user});

  ReviewModel.instance();

  ReviewModel.fromJson(Map<String, dynamic> json) {
    review = json['review'];
    user = UserModel.fromJson(json['user']);
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['review'] = review ?? "";
    data['user'] = user!.toJson();
    data['rating'] = rating ?? "";
    return data;
  }
}
