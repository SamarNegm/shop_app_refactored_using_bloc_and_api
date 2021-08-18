import 'dart:convert';

import 'package:flutter_shop_app_refactored/models/users.dart';

class ShopLoginModel {
  bool status;
  String message;
  users data;
  ShopLoginModel({
    this.status,
    this.message,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data.toMap(),
    };
  }

  factory ShopLoginModel.fromMap(Map<String, dynamic> map) {
    return ShopLoginModel(
      status: map['status'],
      message: map['message'],
      data: users.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopLoginModel.fromJson(String source) =>
      ShopLoginModel.fromMap(json.decode(source));
}
