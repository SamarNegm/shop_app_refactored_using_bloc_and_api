import 'dart:convert';

class FavoriteModelResponse {
  bool status;
  Null message;
  Data data;
  FavoriteModelResponse({
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

  factory FavoriteModelResponse.fromMap(Map<String, dynamic> map) {
    return FavoriteModelResponse(
      status: map['status'],
      message: map['message'],
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteModelResponse.fromJson(String source) =>
      FavoriteModelResponse.fromMap(json.decode(source));
}

class Data {
  int current_page;
  List<FavoriteModel> data;
  String first_page_url;
  int from;
  int last_page;
  String last_page_url;
  dynamic next_page_url;
  String path;
  int per_page;
  String prev_page_url;
  int to;
  int total;
  Data({
    this.current_page,
    this.data,
    this.first_page_url,
    this.from,
    this.last_page,
    this.last_page_url,
    this.next_page_url,
    this.path,
    this.per_page,
    this.prev_page_url,
    this.to,
    this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'current_page': current_page,
      'data': data?.map((x) => x.toMap())?.toList(),
      'first_page_url': first_page_url,
      'from': from,
      'last_page': last_page,
      'last_page_url': last_page_url,
      'next_page_url': next_page_url,
      'path': path,
      'per_page': per_page,
      'prev_page_url': prev_page_url,
      'to': to,
      'total': total,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      current_page: map['current_page'],
      data: List<FavoriteModel>.from(
          map['data']?.map((x) => FavoriteModel.fromMap(x))),
      first_page_url: map['first_page_url'],
      from: map['from'],
      last_page: map['last_page'],
      last_page_url: map['last_page_url'],
      next_page_url: map['next_page_url'],
      path: map['path'],
      per_page: map['per_page'],
      prev_page_url: map['prev_page_url'],
      to: map['to'],
      total: map['total'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));
}

class FavoriteModel {
  int id;
  ProductFavModel product;
  FavoriteModel({
    this.id,
    this.product,
  });

  @override
  String toString() => 'FavoriteModel(id: $id, product: $product)';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': product.toMap(),
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'],
      product: ProductFavModel.fromMap(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteModel.fromJson(String source) =>
      FavoriteModel.fromMap(json.decode(source));
}

class ProductFavModel {
  int id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String image;
  String name;
  String description;

  ProductFavModel({
    this.id,
    this.price,
    this.old_price,
    this.discount,
    this.image,
    this.name,
    this.description,
  });
  void toggleFavoriteStatus() {}
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'old_price': old_price,
      'discount': discount,
      'image': image,
      'name': name,
      'description': description,
    };
  }

  factory ProductFavModel.fromMap(Map<String, dynamic> map) {
    return ProductFavModel(
      id: map['id'],
      price: map['price'],
      old_price: map['old_price'],
      discount: map['discount'],
      image: map['image'],
      name: map['name'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductFavModel.fromJson(String source) =>
      ProductFavModel.fromMap(json.decode(source));
}

class AddOrDeleteResponseModel {
  bool status;
  String message;
  AddOrDeleteResponseData data;
  AddOrDeleteResponseModel({
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

  factory AddOrDeleteResponseModel.fromMap(Map<String, dynamic> map) {
    return AddOrDeleteResponseModel(
      status: map['status'],
      message: map['message'],
      data: AddOrDeleteResponseData.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddOrDeleteResponseModel.fromJson(String source) =>
      AddOrDeleteResponseModel.fromMap(json.decode(source));
}

class AddOrDeleteResponseData {
  int id;
  AddOrDeleteProductModel product;
  AddOrDeleteResponseData({
    this.id,
    this.product,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': product.toMap(),
    };
  }

  factory AddOrDeleteResponseData.fromMap(Map<String, dynamic> map) {
    return AddOrDeleteResponseData(
      id: map['id'],
      product: AddOrDeleteProductModel.fromMap(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddOrDeleteResponseData.fromJson(String source) =>
      AddOrDeleteResponseData.fromMap(json.decode(source));
}

class AddOrDeleteProductModel {
  int id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String image;
  AddOrDeleteProductModel({
    this.id,
    this.price,
    this.old_price,
    this.discount,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'old_price': old_price,
      'discount': discount,
      'image': image,
    };
  }

  factory AddOrDeleteProductModel.fromMap(Map<String, dynamic> map) {
    return AddOrDeleteProductModel(
      id: map['id'],
      price: map['price'],
      old_price: map['old_price'],
      discount: map['discount'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddOrDeleteProductModel.fromJson(String source) =>
      AddOrDeleteProductModel.fromMap(json.decode(source));
}
