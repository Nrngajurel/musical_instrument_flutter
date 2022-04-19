import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_rental_flutter/core/store.dart';
import 'package:music_rental_flutter/pages/models/cart.dart';
import 'package:music_rental_flutter/pages/models/product.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Product catalog;
  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = VxState.store.cart;
    bool isInCart = _cart.products.contains(catalog) ? true : false;

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
          isInCart = isInCart.toggle();
        }
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(StaticValues.darkBluishColor),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
