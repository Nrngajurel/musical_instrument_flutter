import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_rental_flutter/pages/homepage/user/components/cart_page.dart';
import 'package:music_rental_flutter/pages/homepage/user/orders.dart';
import 'package:music_rental_flutter/pages/homepage/user/profile.dart';
import 'package:music_rental_flutter/pages/homepage/user/user_home.dart';
import 'package:music_rental_flutter/pages/login/login_page.dart';

import 'package:velocity_x/velocity_x.dart';

import '../main.dart';

final storage = FlutterSecureStorage();

class BuildDrawer extends StatefulWidget {
  const BuildDrawer({Key? key}) : super(key: key);

  @override
  State<BuildDrawer> createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  // var user = {"name": "John Doe", "email": "nrngajurel@gmail.com"};
  var user = {};

  // @override
  // Future<void> initState() async {
  //   // TODO: implement initState
  //   super.initState();
  //   var newuser = await storage.read(key: "user");
  //   if (newuser != null) {
  //     jsonData=user
  //     user.addAll();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: null,
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: Text("Home"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserHomePage()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: Text("Profile"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserProfile()));
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.shopping_basket,
            ),
            title: const Text("My Order"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomerOrder()));
            },
          ),
          ListTile(
            onTap: () {
              storage.deleteAll();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginPage()));
            },
            leading: const Icon(
              Icons.logout,
            ),
            title: const Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
