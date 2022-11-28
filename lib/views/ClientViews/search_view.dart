import 'package:althouraya/constants.dart';
import 'package:althouraya/size_config.dart';
import 'package:althouraya/view_models/home_cubit/cubit.dart';
import 'package:althouraya/widgets/custom_formField.dart';
import 'package:althouraya/widgets/product_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
    this.isNav = true,
  });

  final bool? isNav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: padding,
        child: Column(
          children: [
            Row(
              children: [
                if (isNav == false) CustomBackButton(),
                SizedBox(
                  width: width(10),
                ),
                CustomSearchForm(
                  onChange: (value) {},
                ),
              ],
            ),
            SizedBox(
              height: height(30),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => HorizontalProductWidget(
                  model: HomeCubit.get(context).productModels[index],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: height(20),
                ),
                itemCount: HomeCubit.get(context).productModels.length,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
