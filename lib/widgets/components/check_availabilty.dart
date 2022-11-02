import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:althouraya/constants.dart';
import 'package:althouraya/size_config.dart';
import 'package:althouraya/widgets/base_widget.dart';
import 'package:althouraya/widgets/components/custom_text.dart';

class CheckEmptyList extends StatelessWidget {
  const CheckEmptyList(
      {Key? key,
      required this.title,
      required this.builder,
      required this.length,
      required this.condition})
      : super(key: key);

  final String title;
  final Widget Function(BuildContext, int) builder;
  final int length;
  final bool condition;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: condition,
      builder: (context) => length == 0
          ? RentXWidget(builder: (rentxcontext) {
              var color = rentxcontext.theme.customTheme;
              return Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: height(200),
                    ),
                    Container(
                      padding: padding,
                      decoration: BoxDecoration(
                          color: color.onPrimary,
                          boxShadow: [boxShadow],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: color.inputFieldBorder,
                          )),
                      child: CustomText(
                        fontSize: width(18),
                        text: "No Available $title",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            })
          : ListView.separated(
              itemBuilder: builder,
              separatorBuilder: (context, index) => SizedBox(
                height: height(15),
              ),
              itemCount: length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
      fallback: (context) => loading,
    );
  }
}
