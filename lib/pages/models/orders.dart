import 'package:music_rental_flutter/pages/static/static_values.dart';

class OrderModel {
  static List<Order> orders = [];

  Order getById(int id) =>
      orders.firstWhere((element) => element.id == id, orElse: null);

  Order getByPosition(int pos) => orders[pos];
}

class Order {
  final int id;
  final String order_date;
  final String customer_id;
  final String product_id;
  final String product_name;
  final String customer_name;
  final String product_price;
  final String product_image;

  Order(
      {required this.id,
      required this.order_date,
      required this.customer_id,
      required this.product_id,
      required this.product_name,
      required this.customer_name,
      required this.product_price,
      required this.product_image});

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map["id"],
      order_date: map["order_date"],
      customer_id: map["customer_id"].toString(),
      product_id: map["product_id"].toString(),
      product_name: map["product_name"],
      customer_name: map["customer_name"],
      product_price: map["product_price"].toString(),
      product_image: map["product_image"],
    );
  }

  toMap() => {
        "id": id,
        "order_date": order_date,
        "customer_id": customer_id,
        "product_id": product_id,
        "product_name": product_name,
        "customer_name": customer_name,
        "product_price": product_price,
        "product_image": product_image,
      };
}
