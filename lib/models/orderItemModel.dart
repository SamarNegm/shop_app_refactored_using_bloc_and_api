import 'package:flutter/foundation.dart';
import 'package:flutter_shop_app_refactored/screens/Cart/cartModel.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartModel> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}
