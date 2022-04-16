import 'package:flutter/material.dart';
import 'package:music_rental_flutter/pages/homepage/user/components/product_image.dart';
import 'package:music_rental_flutter/pages/models/product.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  final Product product;
  const CatalogItem({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(product.id.toString()),
            child: ProductImage(
              image: product.image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                product.name.text.lg
                    .color(StaticValues.darkBluishColor)
                    .bold
                    .make(),
                product.desc.text.xs.color(Colors.grey).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${product.price}".text.bold.lg.make(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            StaticValues.darkBluishColor),
                        shape: MaterialStateProperty.all(
                          const StadiumBorder(),
                        ),
                      ),
                      child: "Buy".text.make(),
                    ),
                  ],
                ).pOnly(right: 8.0),
              ],
            ),
          ),
        ],
      ),
    ).white.rounded.square(120).make().py12();
  }
}
