import 'package:flutter/material.dart';
import 'package:music_rental_flutter/pages/models/orders.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';
import 'package:music_rental_flutter/widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderDetailPage extends StatelessWidget {
  final Order order;
  const OrderDetailPage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: StaticValues.darkBluishColor,
        ),
      ),
      backgroundColor: StaticValues.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${order.product_price}".text.bold.xl2.red800.make(),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(order.id.toString()),
              child: Image.network(StaticValues.host + order.product_image),
            ).h40(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      order.product_name.text.xl3
                          .color(StaticValues.darkBluishColor)
                          .bold
                          .make(),
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
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
