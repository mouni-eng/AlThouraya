import 'package:althouraya/size_config.dart';
import 'package:flutter/material.dart';

class DotsIndecator extends StatelessWidget {
  const DotsIndecator({
    Key? key,
    required this.index, required this.length,
  }) : super(key: key);

  final int index, length;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          length,
          (currentIndex) => currentIndex != index
              ? Container(
                  width: width(8),
                  height: height(8),
                  margin: EdgeInsets.only(right: width(4)),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.hintColor,
                  ),
                )
              : Container(
                  width: width(25),
                  height: height(8),
                  margin: EdgeInsets.only(right: width(4)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: color.primaryColorDark,
                  ),
                ),
        ));
  }
}