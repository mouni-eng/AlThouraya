import 'package:flutter/material.dart';
import 'package:althouraya/constants.dart';
import 'package:althouraya/services/language_service.dart';
import 'package:althouraya/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final void Function(String)? onSubmit;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final bool isPassword;
  final String? Function(String?)? validate;
  final String? label;
  final int? maxLines;
  final String? hintText;
  final int? maxLength;
  final Widget? prefix;
  final bool? isAboutMe;
  final BuildContext context;
  final Widget? suffix;
  final bool isClickable;
  final bool isMapSearch;

  const CustomFormField({
    Key? key,
    required this.context,
    this.hintText,
    this.controller,
    this.isClickable = true,
    this.isPassword = false,
    this.label,
    this.maxLength,
    this.isAboutMe = false,
    this.maxLines = 1,
    this.onChange,
    this.onSubmit,
    this.onTap,
    this.prefix,
    this.suffix,
    this.type,
    this.validate,
    this.isMapSearch = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [boxShadow],
      ),
      height: isAboutMe == true ? height(102) : null,
      child: TextFormField(
        maxLength: maxLength,
        maxLines: maxLines,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        textAlignVertical: TextAlignVertical.center,
        validator: validate,
        decoration: InputDecoration(
          labelText: label,
          isDense: true,
          hintText: hintText,
          fillColor: color.cardColor,
          filled: true,
          errorStyle: const TextStyle(
            height: 0,
          ),
          counterText: "",
          focusColor: color.primaryColor,
          prefixIcon: prefix,
          suffixIcon: suffix,
          contentPadding: EdgeInsets.only(
              right: isMapSearch == true ? 0 : width(15),
              top: height(10),
              bottom: height(10),
              left: isMapSearch == true ? 0 : width(15)),
          hintStyle: TextStyle(
            fontSize: width(14),
            color: color.hintColor,
          ),
          labelStyle: Theme.of(context).textTheme.subtitle2,
          alignLabelWithHint: false,
          floatingLabelStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                color: color.primaryColor,
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: color.primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: color.primaryColor.withOpacity(0.4),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: color.primaryColor,
            ),
          ),
        ),
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}

class CustomSearchForm extends StatelessWidget {
  const CustomSearchForm({
    Key? key,
    this.onChange,
  }) : super(key: key);

  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomFormField(
        context: context,
        hintText: translation(context).serachForProducts,
        onChange: onChange,
        prefix: Padding(
          padding: padding,
          child: SvgPicture.asset(
            "assets/icons/search.svg",
            width: width(25),
            height: height(25),
          ),
        ),
      ),
    );
  }
}
