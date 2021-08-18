import 'dart:convert';

class ProductModel {
  int id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool in_favorites;
  bool in_cart;
  ProductModel({
    this.id,
    this.price,
    this.old_price,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.images,
    this.in_favorites,
    this.in_cart,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'old_price': old_price,
      'discount': discount,
      'image': image,
      'name': name,
      'description': description,
      'images': images,
      'in_favorites': in_favorites,
      'in_cart': in_cart,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      price: map['price'],
      old_price: map['old_price'],
      discount: map['discount'],
      image: map['image'],
      name: map['name'],
      description: map['description'],
      images: List<String>.from(map['images']),
      in_favorites: map['in_favorites'],
      in_cart: map['in_cart'],
    );
  }
  void toggleFavoriteStatus() {
    in_favorites = !in_favorites;
  }

  void toggleCartStatus() {
    in_cart = !in_cart;
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
