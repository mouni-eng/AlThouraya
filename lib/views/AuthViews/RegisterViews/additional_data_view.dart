import 'package:althouraya/services/language_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:althouraya/services/alert_service.dart';
import 'package:althouraya/size_config.dart';
import 'package:althouraya/views/AuthViews/LoginViews/login_view.dart';
import 'package:althouraya/widgets/custom_button.dart';
import 'package:althouraya/widgets/custom_text.dart';

import '../../../view_models/auth_cubit/cubit.dart';
import '../../../view_models/auth_cubit/states.dart';

class AdditionalDataView extends StatelessWidget {
  AdditionalDataView({super.key});

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context);

    return BlocConsumer<AuthCubit, AuthStates>(builder: (context, state) {
      AuthCubit cubit = AuthCubit.get(context);
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PropertiesWidget(
                title: translation(context).username,
                onChange: (value) {
                  cubit.onChangeUserName(value);
                },
              ),
              PropertiesWidget(
                title: translation(context).email,
                onChange: (value) {
                  cubit.onChangeEmailAddress(value);
                },
              ),
              PropertiesWidget(
                title: translation(context).password,
                isPassword: true,
                onChange: (value) {
                  cubit.onChangePassword(value);
                },
              ),
              PropertiesWidget(
                isPassword: true,
                title: translation(context).confirmPassword,
                onChange: (value) {
                  cubit.onChangeConfirmPassword(value);
                },
              ),
              SizedBox(
                height: height(115),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        cubit.onBackStep();
                      },
                      child: Text(
                        translation(context).skip,
                        style: TextStyle(
                          fontSize: width(16),
                          color: color.primaryColorDark,
                        ),
                      )),
                  CustomButton(
                    showLoader: state is RegisterLoadingState,
                    background: color.primaryColor,
                    text: translation(context).next,
                    radius: 6,
                    fontSize: width(16),
                    btnWidth: width(132),
                    btnHeight: height(50),
                    function: () {
                      if (_formkey.currentState!.validate()) {
                        cubit.saveUser();
                      }
                    },
                    isUpperCase: false,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }, listener: (context, state) {
      _formkey.currentState!.validate();
      if (state is RegisterErrorState) {
        AlertService.showSnackbarAlert(
          state.error ?? translation(context).loginValidation,
          SnackbarType.error,
          context,
        );
      }
    });
  }
}
