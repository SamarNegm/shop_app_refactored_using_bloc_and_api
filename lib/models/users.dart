import 'dart:convert';

class users {
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;

  users({
    this.name,
    this.email,
    this.id,
    this.phone,
    this.token,
    this.image,
    this.points,
    this.credit,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'points': points,
      'credit': credit,
      'token': token,
    };
  }

  factory users.fromMap(Map<String, dynamic> map) {
    return users(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      image: map['image'],
      points: map['points'],
      credit: map['credit'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory users.fromJson(String source) => users.fromMap(json.decode(source));
}
