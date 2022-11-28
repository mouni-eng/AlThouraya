import 'package:althouraya/services/language_service.dart';
import 'package:althouraya/views/AuthViews/LoginViews/login_view.dart';
import 'package:althouraya/widgets/custom_button.dart';
import 'package:althouraya/widgets/custom_navigation.dart';
import 'package:althouraya/widgets/custom_text.dart';
import 'package:althouraya/widgets/onBoarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:althouraya/size_config.dart';
import 'package:althouraya/view_models/onBoarding_cubit/cubit.dart';
import 'package:althouraya/view_models/onBoarding_cubit/states.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
              listener: (context, state) {},
              builder: (context, state) {
                OnBoardingCubit cubit = OnBoardingCubit.get(context);

                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width(16),
                    vertical: height(25),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: cubit.controller,
                          onPageChanged: (int index) {
                            cubit.onChangeIndex(index);
                          },
                          physics: const BouncingScrollPhysics(),
                          itemCount: cubit.onBoardingList(context).length,
                          itemBuilder: (BuildContext context, int index) {
                            return OnBoardingWidget(
                                model: cubit.onBoardingList(context)[index]);
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                navigateTo(view: LoginView(), context: context);
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: CustomText(
                                fontSize: width(18),
                                color: color.primaryColor,
                                text: translation(context).skip,
                              )),
                          SmoothPageIndicator(
                            controller: cubit.controller,
                            count: 3,
                            effect: ExpandingDotsEffect(
                              dotColor: color.hintColor,
                              activeDotColor: color.primaryColor,
                              dotHeight: height(7),
                              expansionFactor: 4,
                              dotWidth: width(7),
                              spacing: 5.0,
                            ),
                          ),
                          if (cubit.index != 2)
                            CustomNextButton(
                              background: color.primaryColor,
                              function: () {
                                cubit.onNextStep();
                              },
                            ),
                          if (cubit.index == 2)
                            CustomButton(
                              btnHeight: height(50),
                              btnWidth: width(86),
                              fontSize: width(15),
                              radius: 5,
                              fontWeight: FontWeight.w400,
                              function: () {
                                if (cubit.index != 2) {
                                  cubit.onNextStep();
                                } else {
                                  navigateTo(view: LoginView(), context: context);
                                }
                              },
                              text: translation(context).start,
                            ),
                        ],
                      )
                    ],
                  ),
                );
              })),
    );
  }
}
