import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_rental_flutter/pages/homepage/admin/components/product_add.dart';
import 'package:music_rental_flutter/pages/homepage/admin/list_of_all_product.dart';
import 'package:music_rental_flutter/pages/homepage/admin/orders/list_of_orders.dart';
import 'package:music_rental_flutter/pages/homepage/user/user_home.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';
import 'package:music_rental_flutter/pages/welcome/welcome_page.dart';
import 'package:music_rental_flutter/widgets/admin_drawe.dart';

final storage = FlutterSecureStorage();

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const AddProduct(),
            ),
          );
        },
        backgroundColor: StaticValues.darkBluishColor,
        child: const Icon(Icons.add),
      ),
      drawer: const AdminDrawer(),
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
                      builder: (BuildContext context) => const WelcomePage()));
            },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
      ),
      body: ListOfAllOrder(),
    );
  }
}
