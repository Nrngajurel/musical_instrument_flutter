import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductImage extends StatelessWidget {
  final String image;
  const ProductImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.p8.make().p12().w32(context);
  }
}
