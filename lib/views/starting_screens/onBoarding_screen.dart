import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:althouraya/views/auth_views/user_login/login_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:althouraya/size_config.dart';
import 'package:althouraya/view_models/onBoarding_cubit/cubit.dart';
import 'package:althouraya/view_models/onBoarding_cubit/states.dart';
import 'package:althouraya/widgets/base_widget.dart';
import 'package:althouraya/widgets/components/custom_button.dart';
import 'package:althouraya/widgets/components/custom_text.dart';
import 'package:althouraya/widgets/components/onBoarding_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: RentXWidget(
        builder: (rentxcontext) => SafeArea(
            child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  OnBoardingCubit cubit = OnBoardingCubit.get(context);
                  var color = rentxcontext.theme.customTheme;
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
                            itemCount: cubit.onBoardingList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return OnBoardingBuilder(
                                  model: cubit.onBoardingList[index]);
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  rentxcontext
                                      .route((context) => const LogInView());
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: CustomText(
                                  fontSize: width(18),
                                  color: color.secondary,
                                  text: "Skip",
                                )),
                            SmoothPageIndicator(
                              controller: cubit.controller,
                              count: 3,
                              effect: ExpandingDotsEffect(
                                dotColor: color.kSecondaryColor,
                                activeDotColor: color.secondary,
                                dotHeight: height(7),
                                expansionFactor: 4,
                                dotWidth: width(7),
                                spacing: 5.0,
                              ),
                            ),
                            if (cubit.index != 2)
                              CustomNextButton(
                                function: () {
                                  cubit.onNextStep();
                                },
                              ),
                            if (cubit.index == 2)
                              CustomButton(
                                btnHeight: height(50),
                                btnWidth: width(86),
                                fontSize: width(15),
                                background: color.secondary,
                                radius: 5,
                                fontWeight: FontWeight.w400,
                                function: () {
                                  if (cubit.index != 2) {
                                    cubit.onNextStep();
                                  } else {
                                    rentxcontext
                                        .route((context) => const LogInView());
                                  }
                                },
                                text: "GO!",
                              ),
                          ],
                        )
                      ],
                    ),
                  );
                })),
      ),
    );
  }
}
