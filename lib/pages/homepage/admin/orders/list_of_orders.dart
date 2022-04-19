import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music_rental_flutter/network/network_service.dart';
import 'package:music_rental_flutter/pages/homepage/admin/orders/order_details.dart';
import 'package:music_rental_flutter/pages/homepage/user/components/product_image.dart';
import 'package:music_rental_flutter/pages/models/orders.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';
import 'package:velocity_x/velocity_x.dart';

class ListOfAllOrder extends StatefulWidget {
  ListOfAllOrder({Key? key}) : super(key: key);

  @override
  State<ListOfAllOrder> createState() => _ListOfAllOrderState();
}

class _ListOfAllOrderState extends State<ListOfAllOrder> {
  static var loading = false;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  deleteOrder(order) async {
    final response = await NetworkService.sendAuthRequest(
        url: StaticValues.apiUrlOrder,
        requestType: RequestType.delete,
        body: {
          'id': order.id,
        });
    var decodedData = jsonDecode(response!.body);
    if (decodedData['success'] == 0) {
      print(decodedData);
    } else {
      OrderModel.orders.remove(order);
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
        url: StaticValues.apiUrlOrder, requestType: RequestType.get);
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
    var orderData = decodedData["message"];
    OrderModel.orders = List.from(orderData)
        .map<Order>((order) => Order.fromMap(order))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        "Orders".text.xl3.semiBold.make(),
        // reload button
        // if (loading)
        Expanded(
          child: RefreshIndicator(
              onRefresh: () async {
                loadData();
              },
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: OrderModel.orders.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final order = OrderModel.orders[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OrderDetailPage(order: order)));
                    },
                    child: VxBox(
                      child: Row(
                        children: [
                          Hero(
                            tag: Key(order.id.toString()),
                            child: ProductImage(
                              image: order.product_image,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                order.product_name.text.lg
                                    .color(StaticValues.darkBluishColor)
                                    .bold
                                    .make(),
                                "order by:".text.make(),
                                order.customer_name.text.sm
                                    .color(StaticValues.darkBluishColor)
                                    .bold
                                    .make(),
                                order.order_date
                                    .toDate()
                                    .toString()
                                    .text
                                    .sm
                                    .color(Colors.greenAccent)
                                    .bold
                                    .make(),
                                ButtonBar(
                                  alignment: MainAxisAlignment.spaceBetween,
                                  buttonPadding: EdgeInsets.zero,
                                  children: [
                                    "\$${order.product_price}"
                                        .text
                                        .bold
                                        .lg
                                        .make(),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            // CatalogModel.products.remove(product);
                                            deleteOrder(order);
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
                    ).white.rounded.square(140).make().py12(),
                  );
                },
              )),
        )
        // else
        //   const CircularProgressIndicator().centered().expand(),
      ]),
    );
  }
}
