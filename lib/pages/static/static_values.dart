import 'package:flutter/cupertino.dart';

class StaticValues {
  const StaticValues._();
  static const String host = "http://192.168.254.6:3000";

  static const String apiUrlUser = host + '/api/users';
  static const String apiUrlAdmin = host + '/api/admin';
  static const String apiUrlProduct = host + '/api/product';
  static const String apiUrlOrder = host + '/api/order';

  static const String defaultImage =
      'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60';

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkBluishColor = const Color(0xff403b58);
}
