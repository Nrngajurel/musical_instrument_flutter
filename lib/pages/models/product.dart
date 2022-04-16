import 'package:flutter/foundation.dart';

class CatalogModel {
  static List<Product> products = [];
}

class Product {
  final int id;
  final String name;
  final String desc;
  final num price;
  String image;

  Product(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.image});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "image": image,
      };
}
