import 'dart:convert';

import 'package:flutter_shop_app_refactored/models/ProductModel.dart';

class Response {
  bool status;
  String message;
  ResponseModel data;
  Response({this.status, this.message, this.data});

  Map<String, dynamic> toMap() {
    return {'status': status, 'message': message, 'data': data.toMap()};
  }

  factory Response.fromMap(Map<String, dynamic> map) {
    return Response(
        status: map['status'],
        message: map['message'],
        data: ResponseModel.fromMap(map['data']));
  }

  String toJson() => json.encode(toMap());

  factory Response.fromJson(String source) =>
      Response.fromMap(json.decode(source));
}

class ResponseModel {
  List<CartModel> cart_items;
  dynamic sub_total;
  dynamic total;
  ResponseModel({this.cart_items, this.sub_total, this.total});

  Map<String, dynamic> toMap() {
    return {
      'cart_items': cart_items?.map((x) => x.toMap())?.toList(),
      'sub_total': sub_total,
      'total': total,
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      cart_items: List<CartModel>.from(
          map['cart_items']?.map((x) => CartModel.fromMap(x))),
      sub_total: map['sub_total'],
      total: map['total'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source));
}

class CartModel {
  dynamic id;
  dynamic quantity;
  ProductModel product;
  CartModel({
    this.id,
    this.quantity,
    this.product,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quantity': quantity,
      'product': product.toMap(),
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'],
      quantity: map['quantity'],
      product: ProductModel.fromMap(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source));
}
