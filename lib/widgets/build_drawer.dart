import 'package:flutter/material.dart';
import 'package:music_rental_flutter/pages/login/login_page.dart';

import '../main.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            accountName: Text("Shanand Shrestha"),
            accountEmail: Text("shanandshrestha@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/logo.png"),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: Text("Home"),
          ),
          const ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: Text("Profile"),
          ),
          const ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart"),
          ),
          const ListTile(
            leading: Icon(
              Icons.shopping_basket,
            ),
            title: Text("My Order"),
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
    ;
  }
}
