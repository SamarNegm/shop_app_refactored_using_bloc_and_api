import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app_refactored/models/ProductModel.dart';
import 'package:flutter_shop_app_refactored/network/end_points.dart';
import 'package:flutter_shop_app_refactored/network/local/cache_helper.dart';
import 'package:flutter_shop_app_refactored/network/remote/DioHelper.dart';
import 'package:flutter_shop_app_refactored/screens/Cart/CartState.dart';
import 'package:flutter_shop_app_refactored/screens/Cart/cartModel.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(CartState initialCartState) : super(initialCartState);
  static CartCubit get(context) => BlocProvider.of(context);
  List<CartModel> cartData = [];
  void getCartData() {
    emit(LoadingCartState());
    DioHelper.getData(url: CARTS, token: CacheHelper.getData(key: 'token'))
        .then((value) {
      print(value.data.toString());
      Response cartResponeModel = Response.fromMap(value.data);
      print('ResponseModel>>...?' + cartResponeModel.data.toString());
      print(
          'ResponseModel>>...?' + cartResponeModel.data.cart_items.toString());
      cartData = cartResponeModel.data.cart_items;

      emit(SuccessgState());
    }).onError((error, stackTrace) {
      print('cart error ' + error.toString());
      emit(ErrorState());
    });
  }

  void ToggelCart(ProductModel model) {
    print('toggoling..' + model.id.toString());
    model.toggleCartStatus();
    emit(ToggelCartState());
    DioHelper.postData(
            url: CARTS,
            data: {'product_id': model.id},
            token: CacheHelper.getData(key: 'token'))
        .then((value) {
      print('-----------------value' + value.statusMessage);
      if (value.data['status'] == false) {
        model.toggleCartStatus();
        SnackBar(content: Text('Something went wrong'));
      } else {
        emit(SuccessgState());
      }
    }).onError((error, stackTrace) {
      print('-----------------error' + error);
      model.toggleCartStatus();
      SnackBar(content: Text('Something went wrong'));
      print(error.toString());
      emit(ErrorState());
    });
  }
}
