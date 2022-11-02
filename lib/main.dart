import 'package:althouraya/services/local/cache_helper.dart';
import 'package:althouraya/theme/app_theme.dart';
import 'package:althouraya/view_models/auth_cubit/cubit.dart';
import 'package:althouraya/view_models/location_cubit/cubit.dart';
import 'package:althouraya/view_models/onBoarding_cubit/cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';

void main() async{
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
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => LocationCubit()..fetchData()),
        BlocProvider(create: (_) => OnBoardingCubit()),
      ],
      child: Portal(
        child: MaterialApp(
          title: 'AlThouraya',
          theme: AppTheme.theme,
          home: Container(),
        ),
      ),
    );
  }
}
