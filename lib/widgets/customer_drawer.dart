import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_rental_flutter/pages/homepage/admin/admin_home.dart';
import 'package:music_rental_flutter/pages/homepage/admin/orders/orders.dart';
import 'package:music_rental_flutter/pages/homepage/user/user_home.dart';
import 'package:music_rental_flutter/pages/login/login_page.dart';
import 'package:music_rental_flutter/pages/welcome/welcome_page.dart';

import '../main.dart';

final storage = FlutterSecureStorage();

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({Key? key}) : super(key: key);

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
            accountName: Text("Admin"),
            accountEmail: Text("ADMIN ADMIN"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/logo.png"),
            ),
          ),
          ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text("Home"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminHome(),
                    ));
              }),
          const ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: Text("Profile"),
          ),
          ListTile(
              leading: const Icon(
                Icons.shopping_basket,
              ),
              title: const Text("Orders"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Orders(),
                    ));
              }),
          ListTile(
            onTap: () {
              storage.deleteAll();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const WelcomePage()));
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
