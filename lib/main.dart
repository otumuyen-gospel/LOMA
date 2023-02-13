import 'package:flutter/material.dart';
import 'package:loma/dashboard/create_store.dart';
import 'package:loma/dashboard/dashboard.dart';
import 'package:loma/dashboard/edit_store.dart';
import 'package:loma/dashboard/location.dart';
import 'package:loma/dashboard/new_product.dart';
import 'package:loma/dashboard/orders.dart';
import 'package:loma/dashboard/product_update.dart';
import 'package:loma/dashboard/product_listing.dart';
import 'package:loma/forgot_email.dart';
import 'package:loma/forgot_newpassword.dart';
import 'package:loma/forgot_verify.dart';
import 'package:loma/login.dart';
import 'package:loma/order.dart';
import 'package:loma/privacy.dart';
import 'package:loma/product_search.dart';
import 'package:loma/sign_up.dart';
import 'package:loma/splashscreen.dart';
import 'package:loma/product.dart';
import 'package:loma/store_search.dart';
import 'package:loma/stores.dart';

import 'dashboard/account.dart';
import 'dashboard/dashboard_search.dart';
import 'dashboard/store.dart';
import 'order_processing.dart';

void main() {
  runApp(const Loma());
}

class Loma extends StatelessWidget {
  const Loma({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOMA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext ctx) => const SplashPage(),
        '/Product': (BuildContext ctx) => const Product(),
        '/ProductSearch': (BuildContext ctx) => const ProductSearch(),
        '/StoreSearch': (BuildContext ctx) => const StoreSearch(),
        '/DashboardSearch': (BuildContext ctx) => const DashboardSearch(),
        '/Login': (BuildContext ctx) => const Login(),
        '/Forgot': (BuildContext ctx) => const ForgotEmail(),
        '/Signup': (BuildContext ctx) => const Signup(),
        '/Stores': (BuildContext ctx) => const Stores(),
        '/ForgotChange': (BuildContext ctx) => const ForgotChange(),
        '/ForgotVerify': (BuildContext ctx) => const ForgotVerify(),
        '/Order': (BuildContext ctx) => const Order(),
        '/OrderForm': (BuildContext ctx) => const OrderForm(),
        '/Privacy': (BuildContext ctx) => const Privacy(),
        "/Dashboard": (BuildContext ctx) => const Dashboard(),
        "/CreateStore": (BuildContext ctx) => const CreateStore(),
        "/EditStore": (BuildContext ctx) => const EditStore(),
        "/Store": (BuildContext ctx) => const Store(),
        "/Account": (BuildContext ctx) => const Account(),
        "/Location": (BuildContext ctx) => const Location(),
        "/NewProduct": (BuildContext ctx) => const NewProduct(),
        "/ProductUpdate": (BuildContext ctx) => const ProductUpdate(),
        "/ProductListing": (BuildContext ctx) => const ProductListing(),
        "/Orders": (BuildContext ctx) => const Orders(),
      },
    );
  }
}
