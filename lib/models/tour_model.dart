import 'package:althouraya/infrastructure/request.dart';
import 'package:althouraya/models/address.dart';


class TourModel extends RentXSerialized {
  String? name, description, apUid, agentUid, includes, excludes;
  Address? address;
  int? capacity, booked;
  double? price;
  Time? from, to;
  List<String> images = [];
  String? driver;

  TourModel.instance();

  TourModel({
    required this.name,
    required this.description,
    required this.address,
    required this.includes,
    required this.capacity,
    required this.price,
    required this.from,
    required this.to,
    required this.images,
    required this.apUid,
    required this.agentUid,
    required this.excludes,
    required this.booked,
    required this.driver,
  });

  TourModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    apUid = json['apUid'];
    agentUid = json['agentUid'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    includes = json['includes'];
    excludes = json['excludes'];
    capacity = json['capacity'];
    booked = json['booked'] ?? 0;
    price = json['price'];
    from = Time.fromJson(json['from']);
    to = Time.fromJson(json['to']);
    images = convertList(json['images'] as List, (p0) => p0);
    driver = json['driver'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'apUid': apUid,
      'agentUid': agentUid,
      'address': address == null ? null : address!.toJson(),
      'capacity': capacity,
      'booked': booked ?? 0,
      'price': price,
      'includes': includes,
      'excludes': excludes,
      'from': from!.toJson(),
      'to': to!.toJson(),
      'images': images == null ? [] : images.map((e) => e).toList(),
      'driver': driver,
    };
  }
}

enum Gender { male, female }

class Time {
  int? hour, min;
  String? period;

  Time({
    required this.hour,
    required this.min,
    required this.period,
  });

  Time.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    min = json['min'];
    period = json['period'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'hour': hour,
      'min': min,
      'period': period,
    };
  }
}
