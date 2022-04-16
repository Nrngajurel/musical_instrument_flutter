import 'package:flutter/material.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Music Rental".text.xl4.bold.color(StaticValues.darkBluishColor).make(),
        "Trending Products".text.xl.make(),
      ],
    );
  }
}
