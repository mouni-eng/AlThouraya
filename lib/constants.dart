import 'package:althouraya/models/user_model.dart';
import 'package:althouraya/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const Color kPrimaryColor = Color(0xFF007BFF);
const Color kSecondaryColor = Color(0xFF9EA7B2);
BoxShadow boxShadow = BoxShadow(
  color: const Color(0xFF000000).withOpacity(0.06), //color of shadow
  //spread radius
  blurRadius: width(30), // blur radius
  offset: const Offset(0, 4),
);

EdgeInsets padding = EdgeInsets.symmetric(
  horizontal: width(16),
  vertical: height(16),
);

const loading = Center(
  child: CircularProgressIndicator.adaptive(),
);

UserModel? userModel;

const userRef = "users";
const tourRef = "tours";
const favRef = "wishList";
const rateRef = "reviews";
const bookingRef = "bookings";
