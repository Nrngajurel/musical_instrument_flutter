import 'package:flutter/material.dart';
import 'package:music_rental_flutter/pages/login/login_page.dart';
import 'package:music_rental_flutter/pages/welcome/welcome_page.dart';

import '../main.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key? key}) : super(key: key);

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
            leading: Icon(
              Icons.shopping_basket,
            ),
            title: Text("Orders"),
          ),
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
