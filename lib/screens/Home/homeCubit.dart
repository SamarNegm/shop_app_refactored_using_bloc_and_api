import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app_refactored/models/HomeModel.dart';
import 'package:flutter_shop_app_refactored/models/ProductModel.dart';
import 'package:flutter_shop_app_refactored/network/end_points.dart';
import 'package:flutter_shop_app_refactored/network/local/cache_helper.dart';
import 'package:flutter_shop_app_refactored/network/remote/DioHelper.dart';
import 'package:flutter_shop_app_refactored/screens/Home/HomeState.dart';
import 'package:flutter_shop_app_refactored/screens/OverView.dart';
import 'package:flutter_shop_app_refactored/screens/favorites.dart/Favorits.dart';
import 'package:flutter_shop_app_refactored/screens/profile/profil.dart';

class HomeCubit extends Cubit<HomeState> {
  List<ProductModel> productsData = [];
  List<ProductModel> favData = [];
  List<ProductModel> CartData = [];
  List<ProductModel> SalesData = [];
  HomePageModel homeModel;
  static HomeCubit get(context) => BlocProvider.of(context);

  int selectedPageIndex = 0;
  HomeCubit(HomeState initialState) : super(initialState);
  List<Object> pages = [
    OverView(),
    Favorits(),
    profile(),
  ];
  Future<void> getHomeData() {
    emit(LoadingState());
    DioHelper.getData(url: HOME, token: CacheHelper.getData(key: 'token'))
        .then((value) {
      print('HomeDATA>>' + value.toString());
      HomeResponseModel homeResponseModel =
          HomeResponseModel.fromJson(value.toString());
      homeModel = homeResponseModel.homePageModel;
      productsData = homeModel.products;
      for (int i = 0; i < productsData.length; i++) {
        if (productsData[i].in_favorites) favData.add(productsData[i]);
        if (productsData[i].discount != 0) SalesData.add(productsData[i]);
        if (productsData[i].in_cart) CartData.add(productsData[i]);
      }
      emit(SuccessgState());
    }).onError((error, stackTrace) {
      print('HOMEDATAERROR..' + error.toString());
      emit(ErrorState());
    });
  }

  Future<void> putHomeData(ProductModel model) {
    emit(LoadingState());
    DioHelper.putData(
            url: HOME,
            token: CacheHelper.getData(key: 'token'),
            data: model.toMap())
        .then((value) {
      print(value);
      HomeResponseModel homeResponseModel =
          HomeResponseModel.fromMap(value.data);
      homeModel = homeResponseModel.homePageModel;
      productsData = homeModel.products;
      emit(SuccessgState());
    }).onError((error, stackTrace) {
      print(error);
      emit(ErrorState());
    });
  }

  Future<void> selectPage(int index) async {
    selectedPageIndex = index;
    print(selectedPageIndex);
  }

  void changeNavBar(int index) {
    emit(ChangeNavBarState());
    print('click');
    selectPage(index);
  }

  void ToggelFavorit(ProductModel model) {
    model.toggleFavoriteStatus();
    emit(ToggelFavStateState());
    DioHelper.postData(
            url: FAVORITES,
            data: {'product_id': model.id},
            token: CacheHelper.getData(key: 'token'))
        .then((value) {
      print(value.data['status']);
      if (value.data['status'] == false) {
        model.toggleFavoriteStatus();
        SnackBar(content: Text('Something went wrong'));
      }
      emit(SuccessgState());
    }).onError((error, stackTrace) {
      model.toggleFavoriteStatus();
      SnackBar(content: Text('Something went wrong'));
      print(error.toString());
      emit(ErrorState());
    });
  }
}
