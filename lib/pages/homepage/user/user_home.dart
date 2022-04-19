import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_rental_flutter/network/network_service.dart';
import 'package:music_rental_flutter/pages/homepage/user/components/cart_page.dart';
import 'package:music_rental_flutter/pages/homepage/user/components/product_list.dart';
import 'package:music_rental_flutter/pages/homepage/user/components/user_home_header.dart';
import 'package:music_rental_flutter/pages/models/product.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';
import 'package:music_rental_flutter/pages/welcome/welcome_page.dart';
import 'package:music_rental_flutter/widgets/build_drawer.dart';
import 'package:music_rental_flutter/widgets/customer_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

final storage = FlutterSecureStorage();

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  static var loading = false;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // final productJson =
    //     await rootBundle.loadString("assets/files/products.json");
    setState(() {
      loading = true;
    });

    final response = await NetworkService.sendAuthRequest(
        url: StaticValues.apiUrlProduct, requestType: RequestType.get);
    var decodedData = jsonDecode(response!.body);

    setState(() {
      loading = false;
    });

    if (decodedData['success'] == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: "error occour".text.make(),
        ),
      );
      setState(() {});
      return null;
    }
    var productsData = decodedData["message"];
    CatalogModel.products = List.from(productsData)
        .map<Product>((product) => Product.fromMap(product))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: StaticValues.creamColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const CartPage(),
              ),
            );
          },
          backgroundColor: StaticValues.darkBluishColor,
          child: const Icon(
            Icons.shopping_cart_checkout_sharp,
          ),
        ),
        drawer: const BuildDrawer(),
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                storage.deleteAll();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const WelcomePage()));
              },
              icon: const Icon(
                Icons.exit_to_app,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProductHeader(),
                // reload button
                if (!loading)
                  const ProductList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
