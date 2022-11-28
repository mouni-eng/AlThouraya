import 'package:althouraya/constants.dart';
import 'package:althouraya/models/product_model.dart';
import 'package:althouraya/services/language_service.dart';
import 'package:althouraya/size_config.dart';
import 'package:althouraya/views/ClientViews/explore_view.dart';
import 'package:althouraya/widgets/custom_button.dart';
import 'package:althouraya/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget(
      {super.key, required this.model, required this.onPressed});

  final ProductModel model;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    return Container(
      width: width(180),
      padding: padding,
      margin: EdgeInsets.symmetric(
        vertical: height(10),
      ),
      decoration: BoxDecoration(
        color: color.scaffoldBackgroundColor,
        boxShadow: [boxShadow],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              model.image,
              width: width(100),
              height: height(100),
            ),
          ),
          SizedBox(
            height: height(10),
          ),
          CustomText(
            fontSize: width(14),
            maxlines: 2,
            text: model.title,
          ),
          SizedBox(
            height: height(14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PriceTag(
                      price: model.price,
                      fontSize: width(16),
                    ),
                    CustomText(
                      fontSize: width(10),
                      text: translation(context).taxes,
                      color: color.hintColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width(10),
              ),
              CustomNextButton(
                function: onPressed,
                icon: "cart",
              )
            ],
          )
        ],
      ),
    );
  }
}

class HorizontalProductWidget extends StatelessWidget {
  const HorizontalProductWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    return Container(
      width: width(180),
      padding: padding,
      margin: EdgeInsets.symmetric(
        vertical: height(10),
      ),
      decoration: BoxDecoration(
        color: color.scaffoldBackgroundColor,
        boxShadow: [boxShadow],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Expanded(
        child: Row(
          children: [
            Center(
              child: Image.network(
                model.image,
                width: width(100),
                height: height(100),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height(10),
                  ),
                  CustomText(
                    fontSize: width(14),
                    maxlines: 2,
                    text:model.title,
                  ),
                  SizedBox(
                    height: height(14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PriceTag(
                            price: model.price,
                            fontSize: width(16),
                          ),
                          CustomText(
                            fontSize: width(10),
                            text: translation(context).taxes,
                            color: color.hintColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width(10),
                      ),
                      CustomNextButton(
                        function: () {},
                        icon: "cart",
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}