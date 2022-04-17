import 'package:flutter/material.dart';
import 'package:music_rental_flutter/pages/homepage/admin/components/product_add.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';
import 'package:music_rental_flutter/pages/welcome/welcome_page.dart';
import 'package:music_rental_flutter/widgets/admin_drawe.dart';

import '../../../main.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
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
    );
  }
}
