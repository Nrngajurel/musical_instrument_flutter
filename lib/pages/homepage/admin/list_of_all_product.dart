import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music_rental_flutter/network/network_service.dart';
import 'package:music_rental_flutter/pages/homepage/admin/components/edit_product.dart';
import 'package:music_rental_flutter/pages/homepage/user/components/product_image.dart';
import 'package:music_rental_flutter/pages/homepage/user/home_detail_page.dart';
import 'package:music_rental_flutter/pages/models/product.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';
import 'package:velocity_x/velocity_x.dart';

class ListOfAllProduct extends StatefulWidget {
  ListOfAllProduct({Key? key}) : super(key: key);

  @override
  State<ListOfAllProduct> createState() => _ListOfAllProductState();
}

class _ListOfAllProductState extends State<ListOfAllProduct> {
  static var loading = false;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  deleteProduct(product) async {
    final response = await NetworkService.sendAuthRequest(
        url: StaticValues.apiUrlProduct,
        requestType: RequestType.delete,
        body: {
          'id': product.id,
        });
    var decodedData = jsonDecode(response!.body);
    if (decodedData['success'] == 0) {
      print(decodedData);
    } else {
      CatalogModel.products.remove(product);
      loadData();
    }
    setState(() {});
    return null;
  }

  loadData() async {
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
    return Container(
      child: Column(children: [
        "List Of Product".text.xl3.semiBold.make(),
        // reload button
        // if (loading)
        Expanded(
          child: RefreshIndicator(
              onRefresh: () async {
                loadData();
              },
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: CatalogModel.products.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final product = CatalogModel.products[index];
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
                                  Row(
                                    children: [
                                      // edit button
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => EditProduct(
                                                product: product,
                                              ),
                                            ),
                                          );
                                        },
                                      ).p(5),
                                      // delete button
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          // CatalogModel.products.remove(product);
                                          deleteProduct(product);
                                        },
                                      ).p(5),
                                    ],
                                  )
                                ],
                              ).pOnly(right: 8.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).white.rounded.square(120).make().py12();
                },
              )),
        )
        // else
        //   const CircularProgressIndicator().centered().expand(),
      ]),
    );
  }
}
