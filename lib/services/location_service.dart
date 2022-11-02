import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:althouraya/constants.dart';
import 'package:althouraya/infrastructure/utils.dart';
import 'package:althouraya/models/address.dart';
import 'package:althouraya/models/user_model.dart';
import 'package:althouraya/services/local/cache_helper.dart';

class LocationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateLocation({required Address address,}) async {
    String uid = CacheHelper.getData(key: "uid");
    printLn(uid);
    printLn(address.street2.toString());
    await _firestore
        .collection(userRef)
        .doc(uid)
        .update({"address": address.toJson()});
  }

}
