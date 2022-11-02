import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:althouraya/models/onBoarding_model.dart';
import 'package:althouraya/size_config.dart';
import 'package:althouraya/widgets/base_widget.dart';
import 'package:althouraya/widgets/components/custom_text.dart';

class OnBoardingBuilder extends StatelessWidget {
  const OnBoardingBuilder({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return RentXWidget(
      builder: (rentxcontext) => Column(
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
            color: rentxcontext.theme.customTheme.headline,
          ),
          SizedBox(
            height: height(10),
          ),
          CustomText(
            fontSize: width(16),
            maxlines: 3,
            height: 1.3,
            text: model.subTitle!,
            color: rentxcontext.theme.customTheme.headline3,
          ),
        ],
      ),
    );
  }
}
