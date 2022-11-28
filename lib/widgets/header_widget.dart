import 'package:althouraya/services/language_service.dart';
import 'package:althouraya/size_config.dart';
import 'package:althouraya/views/ClientViews/search_view.dart';
import 'package:althouraya/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    return Row(
      children: [
        CustomText(
          fontSize: width(20),
          text: title,
          fontWeight: FontWeight.w600,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchView(
                  isNav: false,
                ),
              ),
            );
          },
          child: CustomText(
            fontSize: width(16),
            text: translation(context).seeAll,
            fontWeight: FontWeight.w400,
            color: color.primaryColor,
          ),
        ),
      ],
    );
  }
}
