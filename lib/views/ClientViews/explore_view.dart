import 'package:althouraya/constants.dart';
import 'package:althouraya/services/language_service.dart';
import 'package:althouraya/size_config.dart';
import 'package:althouraya/view_models/home_cubit/cubit.dart';
import 'package:althouraya/view_models/home_cubit/states.dart';
import 'package:althouraya/views/common_views/product_details_view.dart';
import 'package:althouraya/widgets/carousal_widget.dart';
import 'package:althouraya/widgets/custom_navigation.dart';
import 'package:althouraya/widgets/custom_text.dart';
import 'package:althouraya/widgets/dots_indecator.dart';
import 'package:althouraya/widgets/product_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/header_widget.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                        fontSize: width(24),
                        fontWeight: FontWeight.w600,
                        text: translation(context).title1,
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/icons/cart.svg',
                      ),
                      SizedBox(
                        width: width(15),
                      ),
                      SvgPicture.asset(
                        'assets/icons/bell.svg',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height(40),
                  ),
                  CarouselSlider(
                    items: List.generate(
                      cubit.getCarousalList(context).length,
                      (index) => CarousalWidget(
                        carousalModel: cubit.getCarousalList(context)[index],
                      ),
                    ),
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        cubit.changeCarousalIndex(index);
                      },
                      height: height(200),
                      initialPage: 0,
                      viewportFraction: 1,
                      enableInfiniteScroll: true,
                      disableCenter: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: height(9),
                  ),
                  DotsIndecator(
                    index: cubit.carousalIndex,
                    length: cubit.getCarousalList(context).length,
                  ),
                  SizedBox(
                    height: height(40),
                  ),
                  HeaderWidget(
                    title: translation(context).latestProducts,
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  SizedBox(
                    height: height(270),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          navigateTo(
                            view: ProductDetailsView(
                                productModel: cubit.productModels[index]),
                            context: context,
                          );
                        },
                        child: ProductWidget(
                          model: cubit.productModels[index],
                          onPressed: () {},
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        width: width(20),
                      ),
                      itemCount: cubit.productModels.length,
                    ),
                  ),
                  SizedBox(
                    height: height(40),
                  ),
                  HeaderWidget(
                    title: translation(context).bestDeals,
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  SizedBox(
                    height: height(270),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          navigateTo(
                            view: ProductDetailsView(
                                productModel: cubit.productModels[index]),
                            context: context,
                          );
                        },
                        child: ProductWidget(
                          model: cubit.productModels[index],
                          onPressed: () {},
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        width: width(20),
                      ),
                      itemCount: cubit.productModels.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
