import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:althouraya/infrastructure/utils.dart';
import 'package:althouraya/models/tour_model.dart';
import 'package:althouraya/models/user_model.dart';
import 'package:althouraya/services/auth_service.dart';
import 'package:althouraya/services/file_service.dart';
import 'package:althouraya/view_models/auth_cubit/states.dart';
import 'package:althouraya/views/auth_views/user_registration/account_data_screen.dart';
import 'package:althouraya/views/auth_views/user_registration/personal_data_screen.dart';
import 'package:althouraya/views/auth_views/user_registration/verify_screen.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthStates());

  static AuthCubit get(context) => BlocProvider.of(context);

  final formkey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  final FileService _fileService = FileService();
  final AuthService _authService = AuthService();

  File? profileImage;
  UserModel signUpRequest = UserModel.instance();

  int index = 0;
  bool isLast = false;
  double percent = 1 / 3;

  PageController controller = PageController();
  FocusNode focusNode = FocusNode();
  String? pin;

  String? emailValidation;
  String? usernameValidation;
  String? verficationId;

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  List<String> headers = [
    "Personal Data",
    "Account Data",
    "Verify your email",
  ];

  List<Widget> steps = [
    PersonalDataScreen(),
    AccountDataScreen(),
    VerifyEmailScreen(),
  ];

  onBackStep() {
    if (percent != 1 / 3) {
      percent -= 1 / 3;
      index -= 1;
      isLast = false;
      emit(OnBackRegistrationStep());
    }

    controller.previousPage(
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  onNextStep() {
    if (percent != 1) {
      percent += 1 / 3;
      index += 1;
      if (index == 2) {
        isLast = true;
      }
      emit(OnNextRegistrationStep());
    }
    controller.nextPage(
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  chooseImage(File file) async {
    profileImage = file;
    emit(ChooseProfileImageState());
  }

  onChangeName(String value) {
    signUpRequest.name = value;
    emit(OnChangeState());
  }

  onChangeCategory(UserRole value) {
    signUpRequest.role = value;
    emit(OnChangeState());
  }

  onChangeSurName(String value) {
    signUpRequest.surname = value;
    emit(OnChangeState());
  }

  onChangeGender(Gender value) {
    signUpRequest.gender = value;
    emit(OnChangeState());
  }

  onChangePhoneNumber(String value) {
    signUpRequest.phoneNumber = value;
    emit(OnChangeState());
  }

  onChangeBirthDate(DateTime value) {
    signUpRequest.birthdate = value;
    emit(OnChangeState());
  }

  onChangeUserName(String value) {
    signUpRequest.username = value;
    emit(OnChangeState());
  }

  onChangeCarType(String value) {
    signUpRequest.carType = value;
    emit(OnChangeState());
  }

  onChangeCarPlate(String value) {
    signUpRequest.carPlate = value;
    emit(OnChangeState());
  }

  onChangeEmailAddress(String value) {
    signUpRequest.email = value;
    emit(OnChangeState());
  }

  onChangePassword(String value) {
    signUpRequest.password = value;
    emit(OnChangeState());
  }

  onChangeConfirmPassword(String value) {
    signUpRequest.confirmPassword = value;
    emit(OnChangeState());
  }

  onChangePin(String value) {
    pin = value;
    emit(OnChangeState());
  }

  verficationIdChanged(String value) {
    verficationId = value;
    emit(OnChangeState());
  }

  logIn() {
    if (formkey.currentState!.validate()) {
      emit(LogInLoadingState());
      _authService
          .login(email: signUpRequest.email, password: signUpRequest.password)
          .then((value) {
        emit(LogInSuccessState());
      }).catchError((error) {
        emit(LogInErrorState(error: error.toString()));
      });
    }
  }

  saveUser() {
    emit(RegisterLoadingState());
    _authService.register(model: signUpRequest).then((value) async {
      await uploadProfilePicture();
      _authService.saveUser(model: signUpRequest);
    }).then((value) {
      onNextStep();
      verifyPhoneNumber();
      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterErrorState(error: error.message));
    });
  }

  uploadProfilePicture() async {
    if (profileImage != null && signUpRequest.profilePictureId == null) {
      await _fileService.uploadFile(profileImage!).then((value) {
        signUpRequest.profilePictureId = value;
      }).catchError((error) {
        printLn(error);
      });
    }
  }

  verifyPhoneNumber() {
    _authService.verfiyPhoneNumber(
        phoneNumber: signUpRequest.phoneNumber,
        onSent: (String vId, int? token) {
          verficationIdChanged(vId);
          emit(CodeSentState());
        });
  }

  Future<void> confirmOtp() async {
    emit(OtpConfirmedLoadingState());
    _authService.confirmOtp(vId: verficationId!, code: pin).then((value) {
      emit(OtpConfirmedSuccessState());
    }).catchError((error) {
      emit(OtpConfirmedErrorState(error: error.message));
    });
  }

  onNextValidation(context) {
    if (index == 0) {
      if (formKey1.currentState!.validate() &&
          signUpRequest.birthdate != null &&
          signUpRequest.gender != null) {
        onNextStep();
      }
    } else if (index == 1) {
      if (formKey2.currentState!.validate()) {
        saveUser();
      }
    } else {
      if (formKey3.currentState!.validate()) {
        confirmOtp();
      }
    }
  }
}
