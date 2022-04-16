import 'package:flutter/material.dart';
import 'package:music_rental_flutter/pages/models/product.dart';

class ItemWidget extends StatelessWidget {
  final Product product;
  const ItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${product.name} pressed");
        },
        leading: Image.network(product.image),
        title: Text(product.name),
        subtitle: Text(product.desc),
        trailing: Text(
          "Rs." + product.price.toString(),
          textScaleFactor: 1.5,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
