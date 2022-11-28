import 'package:althouraya/constants.dart';
import 'package:althouraya/services/local/cache_helper.dart';
import 'package:althouraya/view_models/app_cubit/cubit.dart';
import 'package:althouraya/view_models/app_cubit/states.dart';
import 'package:althouraya/view_models/auth_cubit/cubit.dart';
import 'package:althouraya/view_models/client_cubit/cubit.dart';
import 'package:althouraya/view_models/home_cubit/cubit.dart';
import 'package:althouraya/view_models/onBoarding_cubit/cubit.dart';
import 'package:althouraya/views/ClientViews/layout_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  runApp(const AlThouraya());
}

class AlThouraya extends StatelessWidget {
  const AlThouraya({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppCubit()),
        BlocProvider(create: (_) => ClientCubit()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => OnBoardingCubit()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return Portal(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                theme: lightTheme,
                home: const ClientLayoutView(),
              ),
            );
          }),
    );
  }
}
