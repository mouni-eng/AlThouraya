import 'package:althouraya/infrastructure/request.dart';
import 'package:althouraya/models/user_model.dart';

class ReviewModel extends RentXSerialized {
  UserModel? user;
  String? review, apUid;
  double? rating;
  ReviewModel(
      {required this.rating,
      required this.review,
      required this.apUid,
      required this.user});

  ReviewModel.instance();

  ReviewModel.fromJson(Map<String, dynamic> json) {
    review = json['review'];
    user = UserModel.fromJson(json['user']);
    apUid = json['apUid'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['review'] = review ?? "";
    data['user'] = user!.toJson();
    data['apUid'] = apUid ?? "";
    data['rating'] = rating ?? "";
    return data;
  }
}
