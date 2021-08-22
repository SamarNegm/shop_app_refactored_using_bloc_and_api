import 'dart:convert';

import 'package:flutter_shop_app_refactored/models/users.dart';

class ProfileModel {
  bool satatus;
  String message;
  users data;
  ProfileModel({
    this.satatus,
    this.message,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'satatus': satatus,
      'message': message,
      'data': data.toMap(),
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      satatus: map['satatus'],
      message: map['message'],
      data: users.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source));
}
