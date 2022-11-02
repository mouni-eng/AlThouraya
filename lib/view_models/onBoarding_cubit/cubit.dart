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

  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      title: "AlThouraya",
      image: "assets/images/welcome.svg",
      subTitle:
          "AlTouraya is a domestic, inbound Security company, located in Saudi Arabia.",
    ),
    OnBoardingModel(
      title: "Online E-commerce App",
      image: "assets/images/trip.svg",
      subTitle:
          "Explore our best selling secuirty equipments, we have a great offers for you..",
    ),
    OnBoardingModel(
      title: "Book Your Installation Technician !",
      image: "assets/images/driver.svg",
      subTitle:
          "We offer a great Installation service in which you can book and track your installation service",
    ),
  ];

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
