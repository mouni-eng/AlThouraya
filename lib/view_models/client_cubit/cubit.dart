import 'package:althouraya/view_models/client_cubit/states.dart';
import 'package:althouraya/views/ClientViews/explore_view.dart';
import 'package:althouraya/views/ClientViews/search_view.dart';
import 'package:althouraya/views/ClientViews/wishList_view.dart';
import 'package:althouraya/views/common_views/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientCubit extends Cubit<ClientStates> {
  ClientCubit() : super(ClientStates());

  static ClientCubit get(context) => BlocProvider.of(context);

  List<Widget> views = [
    ExploreView(),
    SearchView(),
    WishListView(),
    ProfileView(),
  ];

  int index = 0;

  chooseBottomNavIndex(int value) {
    index = value;
    emit(OnChangeBottomNavIndex());
  }
}
