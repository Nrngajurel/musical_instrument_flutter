import 'package:flutter/material.dart';
import 'package:music_rental_flutter/pages/homepage/user/components/catalog_item.dart';
import 'package:music_rental_flutter/pages/homepage/user/home_detail_page.dart';
import 'package:music_rental_flutter/pages/models/product.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.products.length,
      itemBuilder: (context, index) {
        final product = CatalogModel.products[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(product: product),
              ),
            );
          },
          child: CatalogItem(
            product: product,
          ),
        );
      },
    );
  }
}
