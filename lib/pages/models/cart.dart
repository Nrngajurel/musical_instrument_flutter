import 'package:music_rental_flutter/core/store.dart';
import 'package:music_rental_flutter/pages/models/product.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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
}

class AddMutation extends VxMutation<MyStore> {
  final Product product;

  AddMutation(this.product);

  @override
  perform() {
    store!.cart!._productIds.add(product.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Product product;

  RemoveMutation(this.product);

  @override
  perform() {
    store!.cart!._productIds.remove(product.id);
  }
}

// remove all items from cart
class RemoveAllMutation extends VxMutation<MyStore> {
  @override
  perform() {
    store!.cart!._productIds.clear();
  }
}
