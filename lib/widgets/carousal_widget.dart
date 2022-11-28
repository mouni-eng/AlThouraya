import 'package:althouraya/constants.dart';
import 'package:althouraya/models/carousal_model.dart';
import 'package:althouraya/size_config.dart';
import 'package:althouraya/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CarousalWidget extends StatelessWidget {
  const CarousalWidget({
    Key? key,
    required this.carousalModel,
  }) : super(key: key);

  final CarousalModel carousalModel;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    return Container(
      width: double.infinity,
      height: height(200),
      margin: EdgeInsets.symmetric(
        horizontal: width(5),
      ),
      decoration: BoxDecoration(
        color: color.primaryColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    fontSize: width(20),
                    fontWeight: FontWeight.w600,
                    maxlines: 2,
                    text: carousalModel.title,
                  ),
                  SizedBox(
                    height: height(15),
                  ),
                  CustomText(
                    fontSize: width(14),
                    fontWeight: FontWeight.w400,
                    maxlines: 3,
                    height: 1.4,
                    text: carousalModel.subTitle,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: width(15),
            ),
            Image.network(
              carousalModel.image,
              width: width(130),
              height: height(130),
            ),
          ],
        ),
      ),
    );
  }
}
