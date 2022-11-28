import 'package:althouraya/models/onBoarding_model.dart';
import 'package:althouraya/size_config.dart';
import 'package:althouraya/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({super.key, required this.model});

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height(50),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFFFFF2E8),
            ),
            child: SvgPicture.asset(
              model.image!,
              width: width(350),
              height: height(405),
            ),
          ),
        ),
        SizedBox(
          height: height(67),
        ),
        CustomText(
          fontSize: width(24),
          text: model.title!,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: height(10),
        ),
        CustomText(
          fontSize: width(16),
          maxlines: 3,
          height: 1.3,
          text: model.subTitle!,
          color: color.hintColor,
        ),
      ],
    );
  }
}
