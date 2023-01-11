import 'package:flutter/material.dart';
import 'package:loma/login.dart';
import 'package:loma/product_search.dart';
import 'package:loma/splashscreen.dart';
import 'package:loma/product.dart';
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
        '/Login': (BuildContext ctx) => const Login(),
      },
    );

  }
}
