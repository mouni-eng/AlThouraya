import 'package:althouraya/size_config.dart';
import 'package:althouraya/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class RatingComponent extends StatelessWidget {
  const RatingComponent({
    Key? key,
    required this.rate,
  }) : super(key: key);

  final String rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.star_rate_rounded,
          color: Colors.amberAccent,
          size: 28,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 3,
          ),
          child: CustomText(
            fontSize: width(14),
            text: rate,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}