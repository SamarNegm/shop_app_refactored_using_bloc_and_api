import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app_refactored/models/ShopLoginModel.dart';
import 'package:flutter_shop_app_refactored/models/users.dart';
import 'package:flutter_shop_app_refactored/network/end_points.dart';
import 'package:flutter_shop_app_refactored/network/local/cache_helper.dart';
import 'package:flutter_shop_app_refactored/network/remote/DioHelper.dart';
import 'package:flutter_shop_app_refactored/screens/Home/products_overview_screen.dart';
import 'package:flutter_shop_app_refactored/screens/auth/authState.dart';
import 'package:flutter_shop_app_refactored/screens/auth/auth_screen.dart';
import 'package:flutter_shop_app_refactored/widgets/commonWidgets.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  ShopLoginModel loginModel;
  users currentUser;
  var authMode = AuthMode.Login;
  void switchAuthMode() {
    if (authMode == AuthMode.Login) {
      authMode = AuthMode.Signup;
    } else {
      authMode = AuthMode.Login;
    }
  }

  void userLogin({
    @required String email,
    @required String password,
    BuildContext context,
  }) {
    emit(ShopLoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data.toString() + ' ok');
      loginModel = ShopLoginModel.fromMap(value.data);
      if (loginModel.status == true) {
        CacheHelper.saveData(key: 'token', value: loginModel.data.token);
        currentUser = loginModel.data;
        Navigator.of(context)
            .pushReplacementNamed(ProductsOverviewScreen.routName);
        emit(ShopLoginSuccessState(loginModel));
      } else {
        emit(ShopLoginErrorState(loginModel.message));
        showErrorDialog(loginModel.message, context);
      }
      print(value.data['status']);
    }).catchError((error) {
      print(error.toString());
      showErrorDialog(error.toString(), context);
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        !isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShopChangePasswordVisibilityState());
  }
}
