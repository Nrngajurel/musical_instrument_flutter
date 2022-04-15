import 'package:flutter/material.dart';
import 'package:music_rental_flutter/main.dart';
import 'package:music_rental_flutter/pages/login/login_page.dart';
import 'package:music_rental_flutter/pages/models/product.dart';
import 'package:music_rental_flutter/widgets/build_drawer.dart';
import 'package:music_rental_flutter/widgets/item_widget.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      builder: (BuildContext context) => const LoginPage()));
            },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              return ItemWidget(product: CatalogModel.items[index]);
            }),
      ),
    );
  }
}
