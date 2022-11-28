import 'package:althouraya/constants.dart';
import 'package:althouraya/services/language_service.dart';
import 'package:althouraya/size_config.dart';
import 'package:althouraya/view_models/client_cubit/cubit.dart';
import 'package:althouraya/view_models/client_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClientLayoutView extends StatelessWidget {
  const ClientLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);
    SizeConfig().init(context);
    return BlocConsumer<ClientCubit, ClientStates>(
      listener: (context, state) {
        /*if (state is ChooseBottomNavState) {
          if (state.index == 1) {
            SearchCubit.get(context).getMapRentals();
            state.completeNavigation(true);
          } else if (state.index == 2) {
            rentxcontext
                .requireAuth(
                    () => ClientBookingsCubit.get(context).getBookings())
                .then((value) => state.completeNavigation(value));
          } else if (state.index == 3) {
            rentxcontext
                .requireAuth(() => ProfileCubit.get(context).getProfileData())
                .then((value) => state.completeNavigation(value));
          } else {
            state.completeNavigation(true);
          }
        }*/
      },
      builder: (context, state) {
        ClientCubit cubit = ClientCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: cubit.views[cubit.index],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [boxShadow],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: BottomNavigationBar(
                backgroundColor: color.scaffoldBackgroundColor,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: TextStyle(
                  color: color.primaryColor,
                  fontSize: width(12),
                ),
                unselectedLabelStyle: TextStyle(
                  color: color.hintColor,
                  fontSize: width(12),
                ),
                selectedItemColor: color.primaryColorDark,
                unselectedItemColor: color.primaryColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/home.svg',
                      width: width(26),
                      height: height(26),
                      color: color.primaryColor,
                    ),
                    activeIcon: SvgPicture.asset(
                      "assets/icons/home.svg",
                      width: width(26),
                      height: height(26),
                    ),
                    label: translation(context).explore,
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/search.svg',
                      width: width(26),
                      height: height(26),
                      color: color.primaryColor,
                    ),
                    activeIcon: SvgPicture.asset(
                      "assets/icons/search.svg",
                      width: width(26),
                      height: height(26),
                    ),
                    label: translation(context).search,
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/bookmark.svg',
                      width: width(26),
                      height: height(26),
                      color: color.primaryColor,
                    ),
                    activeIcon: SvgPicture.asset(
                      "assets/icons/bookmark.svg",
                      width: width(26),
                      height: height(26),
                    ),
                    label: translation(context).wishList,
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/user.svg',
                      width: width(26),
                      height: height(26),
                      color: color.primaryColor,
                    ),
                    activeIcon: SvgPicture.asset(
                      "assets/icons/user.svg",
                      width: width(26),
                      height: height(26),
                    ),
                    label: translation(context).profile,
                  ),
                ],
                currentIndex: cubit.index,
                onTap: (value) {
                  cubit.chooseBottomNavIndex(value);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
