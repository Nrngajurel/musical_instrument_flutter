import 'package:music_rental_flutter/pages/models/product.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;
  //catalog fields
  late CatalogModel _catalog;
  //collection of ids - store ids of each item
  final List<int> _productIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //get items in the cart
  List<Product> get products =>
      _productIds.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalPrice =>
      products.fold(0, (total, current) => total + current.price);

  //add item
  void add(Product product) {
    _productIds.add(product.id);
  }

  //remove items
  void remove(Product product) {
    _productIds.remove(product.id);
  }
}
