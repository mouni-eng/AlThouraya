import 'package:flutter/material.dart';
import 'package:althouraya/size_config.dart';
import 'package:althouraya/widgets/base_widget.dart';
import 'package:althouraya/widgets/components/custom_text.dart';

class PriceTag extends StatelessWidget {
  const PriceTag(
      {Key? key,
      required this.price,
      this.duration,
      required this.showDuration})
      : super(key: key);

  final String? price, duration;
  final bool showDuration;

  @override
  Widget build(BuildContext context) {
    return RentXWidget(builder: (rentxcontext) {
      var color = rentxcontext.theme.customTheme;
      return Row(
        children: [
          CustomText(
            fontSize: width(16),
            text: "$price OMR",
            fontWeight: FontWeight.w600,
            color: color.primary,
          ),
          if (showDuration)
            CustomText(
              fontSize: width(12),
              text: "/$duration",
              color: color.headline3,
            ),
        ],
      );
    });
  }
}
