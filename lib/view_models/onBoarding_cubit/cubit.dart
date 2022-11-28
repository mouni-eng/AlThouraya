import 'package:althouraya/services/language_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:althouraya/models/onBoarding_model.dart';
import 'package:althouraya/view_models/onBoarding_cubit/states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingStates());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  PageController controller = PageController();

  bool isLast = false;

  int index = 0;

  onChangeIndex(int value) {
    index = value;
    emit(OnNextRegistrationStep());
  }

  List<OnBoardingModel> onBoardingList(context) {
    return [
      OnBoardingModel(
        title: translation(context).title1,
        image: "assets/images/welcome.svg",
        subTitle: translation(context).onBoarding1,
      ),
      OnBoardingModel(
        title: translation(context).title2,
        image: "assets/images/booking.svg",
        subTitle: translation(context).onBoarding2,
      ),
      OnBoardingModel(
        title: translation(context).title3,
        image: "assets/images/tracking.svg",
        subTitle: translation(context).onBoarding3,
      ),
    ];
  }

  onBackStep() {
    index -= 1;
    isLast = false;
    emit(OnBackRegistrationStep());

    controller.previousPage(
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  onNextStep() {
    index += 1;
    if (index == 2) {
      isLast = true;
    }
    emit(OnNextRegistrationStep());
    controller.nextPage(
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.fastLinearToSlowEaseIn);
  }
}
