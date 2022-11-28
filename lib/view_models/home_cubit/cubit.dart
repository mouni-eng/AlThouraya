import 'package:althouraya/models/carousal_model.dart';
import 'package:althouraya/models/product_model.dart';
import 'package:althouraya/models/review_model.dart';
import 'package:althouraya/models/user_model.dart';
import 'package:althouraya/services/language_service.dart';
import 'package:althouraya/view_models/home_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeStates());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<CarousalModel> getCarousalList(context) {
    return [
      CarousalModel(
        title: translation(context).carousalTitle1,
        subTitle: translation(context).carousalSubTitle1,
        image:
            "https://www.lorextechnology.com/images/products/_2016/LEV/LEV2724B/1200x800/varifocal-cvi-dome-camera-LEV2724B-L5.png",
      ),
      CarousalModel(
        title: translation(context).carousalTitle2,
        subTitle: translation(context).carousalSubTitle2,
        image:
            "https://th.bing.com/th/id/R.040266d0bb7585add27e44663c3adcdd?rik=vcPgP%2fvHV5G7ig&pid=ImgRaw&r=0",
      ),
    ];
  }

  List<ProductModel> productModels = [
    ProductModel(
      title: "Lorex LBV1521PM HD Weatherproof Night Vision Security Camera",
      image:
          "https://www.lorextechnology.com/images/products/_2016/LEV/LEV2724B/1200x800/varifocal-cvi-dome-camera-LEV2724B-L5.png",
      price: "1300",
      ratings: [
        ReviewModel(
          rating: 5,
          review: "I really Recommend this product",
          user: UserModel(
            name: "Mohamed",
            surname: "Mounir",
          ),
        ),
        ReviewModel(
          rating: 3,
          review: "I think this product could be better",
          user: UserModel(
            name: "Khaled",
            surname: "Salah",
          ),
        ),
        ReviewModel(
          rating: 3,
          review: "I think this product could be better",
          user: UserModel(
            name: "Khaled",
            surname: "Salah",
          ),
        ),
      ],
    ),
    ProductModel(
      title: "Lorex LBV1521PM HD Weatherproof Night Vision Security Camera",
      image:
          "https://th.bing.com/th/id/R.8610d5d8fd322731b842f88f6af87d18?rik=wbEOPcvFUDuJDQ&pid=ImgRaw&r=0",
      price: "1300",
      ratings: [],
    ),
    ProductModel(
      title: "Lorex LBV1521PM HD Weatherproof Night Vision Security Camera",
      image:
          "https://th.bing.com/th/id/R.e9b4ba8950a2b72944e52c6718f5b6d9?rik=3RiJMWuJIwXygQ&pid=ImgRaw&r=0",
      price: "1300",
      ratings: [],
    ),
  ];

  int carousalIndex = 0;

  changeCarousalIndex(int index) {
    carousalIndex = index;
    emit(OnCarousalChange());
  }
}
