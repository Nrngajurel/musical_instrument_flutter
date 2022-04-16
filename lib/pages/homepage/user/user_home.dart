import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_rental_flutter/pages/homepage/user/components/product_list.dart';
import 'package:music_rental_flutter/pages/homepage/user/components/user_home_header.dart';
import 'package:music_rental_flutter/pages/models/product.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';
import 'package:music_rental_flutter/widgets/build_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final productJson =
        await rootBundle.loadString("assets/files/products.json");
    var decodedData = jsonDecode(productJson);
    var productsData = decodedData["products"];
    CatalogModel.products = List.from(productsData)
        .map<Product>((product) => Product.fromMap(product))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: StaticValues.creamColor,
        drawer: const BuildDrawer(),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProductHeader(),
                if (CatalogModel.products.isNotEmpty)
                  const ProductList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
