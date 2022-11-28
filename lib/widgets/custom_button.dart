import 'package:althouraya/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:althouraya/size_config.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final double? btnWidth;
  final double? btnHeight;
  final Color? background;
  final bool? isUpperCase;
  final double? radius;
  final double? fontSize;
  final Function()? function;
  final String? text;
  final String? svgLeadingIcon;
  final bool? showLoader;
  final bool? enabled;
  final FontWeight? fontWeight;

  const CustomButton({
    Key? key,
    this.btnWidth = double.infinity,
    this.background,
    this.radius = 6.0,
    required this.fontSize,
    this.isUpperCase = false,
    required this.function,
    required this.text,
    this.svgLeadingIcon,
    this.showLoader = false,
    this.btnHeight = 48,
    this.enabled = true,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bg = background ?? Theme.of(context).primaryColor;
    return Container(
      width: btnWidth,
      height: btnHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius!,
        ),
        color: showLoader! || !enabled! ? bg.withOpacity(0.3) : bg,
      ),
      child: MaterialButton(
          onPressed: showLoader! || !enabled! ? null : function,
          child: _rowWidget(context)),
    );
  }

  Widget _rowWidget(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (svgLeadingIcon != null)
          SvgPicture.asset(
            svgLeadingIcon!,
          ),
        if (svgLeadingIcon != null)
          SizedBox(
            width: width(14),
          ),
        if (showLoader!)
          SizedBox(
              width: height(btnHeight! * 0.7),
              height: height(btnHeight! * 0.7),
              child: const CircularProgressIndicator.adaptive()),
        if (showLoader!)
          SizedBox(
            width: width(14),
          ),
        _textWidget(context),
      ],
    );
  }

  Widget _textWidget(context) {
    return Expanded(
        child: Center(
      child: CustomText(
        text: isUpperCase! ? text!.toUpperCase() : text!,
        color: Theme.of(context).backgroundColor,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize!,
      ),
    ));
  }
}

class CustomNextButton extends StatelessWidget {
  const CustomNextButton(
      {Key? key, this.background, required this.function, this.icon})
      : super(key: key);

  final Color? background;
  final void Function() function;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    var bg = Theme.of(context);
    return Container(
      width: width(45),
      height: height(45),
      decoration: BoxDecoration(
        shape: icon == null ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: icon != null ? BorderRadius.circular(8) : null,
        color: background ?? bg.primaryColor.withOpacity(0.4),
      ),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: function,
        child: icon == null
            ? Center(
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: bg.backgroundColor,
                  size: 16,
                ),
              )
            : SvgPicture.asset(
                "assets/icons/$icon.svg",
                width: width(25),
                height: height(25),
              ),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          padding: EdgeInsets.symmetric(
            vertical: height(18),
            horizontal: width(16),
          ),
          decoration: BoxDecoration(
            color: color.primaryColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            "assets/icons/back.svg",
            width: width(20),
            height: height(20),
          )),
    );
  }
}

class CustomBookMarkWidget extends StatelessWidget {
  const CustomBookMarkWidget({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(
            vertical: height(18),
            horizontal: width(16),
          ),
          decoration: BoxDecoration(
            color: color.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [boxShadow],
          ),
          child: SvgPicture.asset(
            "assets/icons/bookmark.svg",
            width: width(22),
            height: height(22),
          )),
    );
  }
}
