import 'package:flutter_shop_app_refactored/models/ShopLoginModel.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialState extends ShopLoginStates {}

class ShopLoginLoadingState extends ShopLoginStates {}

class ShopLoginSuccessState extends ShopLoginStates {
  ShopLoginSuccessState(ShopLoginModel model);
}

class ShopLoginErrorState extends ShopLoginStates {
  ShopLoginErrorState(String error);
}

class ShopChangePasswordVisibilityState extends ShopLoginStates {}
