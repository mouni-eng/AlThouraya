import 'package:althouraya/constants.dart';
import 'package:althouraya/infrastructure/utils.dart';
import 'package:althouraya/models/product_model.dart';
import 'package:althouraya/size_config.dart';
import 'package:althouraya/widgets/custom_button.dart';
import 'package:althouraya/widgets/custom_text.dart';
import 'package:althouraya/widgets/rating_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    return Scaffold(
      backgroundColor: color.primaryColorLight,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: padding,
              child: Stack(
                children: [
                  Center(
                    child: Image.network(
                      productModel.image,
                      width: width(300),
                      height: height(300),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          "assets/icons/back.svg",
                        ),
                      ),
                      CustomBookMarkWidget(
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: height(20),
            ),
            Container(
              height: height(500),
              width: double.infinity,
              padding: padding * 2,
              decoration: BoxDecoration(
                color: color.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
                boxShadow: [boxShadow],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          fontSize: width(16),
                          text: productModel.title,
                          fontWeight: FontWeight.w600,
                          maxlines: 2,
                        ),
                      ),
                      SizedBox(
                        width: width(30),
                      ),
                      RatingComponent(
                          rate: RatingUtil.getRating(productModel.ratings))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
