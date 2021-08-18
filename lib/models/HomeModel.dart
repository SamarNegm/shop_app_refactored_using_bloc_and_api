import 'dart:convert';

import 'package:flutter_shop_app_refactored/models/ProductModel.dart';

class HomeResponseModel {
  bool status;
  String message;
  HomePageModel homePageModel;
  HomeResponseModel({
    this.status,
    this.message,
    this.homePageModel,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'homePageModel': homePageModel.toMap(),
    };
  }

  factory HomeResponseModel.fromMap(Map<String, dynamic> map) {
    return HomeResponseModel(
      status: map['status'],
      message: map['message'],
      homePageModel: HomePageModel.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeResponseModel.fromJson(String source) =>
      HomeResponseModel.fromMap(json.decode(source));
}

class HomePageModel {
  List<BannerModel> banners = [];
  List<ProductModel> products = [];
  HomePageModel({
    this.banners,
    this.products,
  });

  @override
  String toString() => 'HomePageModel(banners: $banners, products: $products)';

  Map<String, dynamic> toMap() {
    return {
      'banners': banners?.map((x) => x.toMap())?.toList(),
      'products': products?.map((x) => x.toMap())?.toList(),
    };
  }

  factory HomePageModel.fromMap(Map<String, dynamic> map) {
    return HomePageModel(
      banners: List<BannerModel>.from(
          map['banners']?.map((x) => BannerModel.fromMap(x))),
      products: List<ProductModel>.from(
          map['products']?.map((x) => ProductModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomePageModel.fromJson(String source) =>
      HomePageModel.fromMap(json.decode(source));
}

class BannerModel {
  int id;
  String image;
  // Category category;
  BannerModel({
    this.id,
    this.image,
    //   this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      //  'category': category.toMap(),
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'],
      image: map['image'],
      //category: Category.fromMap(map['category']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(String source) =>
      BannerModel.fromMap(json.decode(source));
}

class Category {
  int id;
  String image;
  String name;
  Category({
    this.id,
    this.image,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      image: map['image'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));
}
