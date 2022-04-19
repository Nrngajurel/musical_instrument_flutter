import 'package:flutter/material.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductImage extends StatelessWidget {
  final String image;
  const ProductImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(StaticValues.host + image)
        .box
        .p8
        .make()
        .p12()
        .w32(context);
  }
}
