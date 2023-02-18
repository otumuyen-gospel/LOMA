import 'package:flutter/material.dart';
import 'package:loma/category_drawal.dart';
import 'package:loma/product_action.dart';
import 'package:loma/product_more.dart';
import 'package:loma/product_order.dart';
import 'package:loma/product_similar.dart';

class Order extends StatefulWidget {
  const Order({super.key});
  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  Future<Object> _pushPage(BuildContext context) async {
    return Navigator.popAndPushNamed(context, "/Product");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _pushPage(context);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: const Text(
              "LOMA",
              style: TextStyle(color: Colors.blue, fontFamily: 'verdana'),
            ),
            leading: Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.blue,
                ),
              );
            }),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/ProductSearch");
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.blue,
                  )),
              TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/Product");
                },
                child: const Text(
                  "Products",
                  style: TextStyle(color: Colors.blue, fontFamily: 'verdana'),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/Login");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: const Text(
                  "Account",
                  style: TextStyle(color: Colors.white, fontFamily: 'verdana'),
                ),
              ),
            ],
          ),
          drawer: drawer,
          body: ListView(
            padding: const EdgeInsets.only(bottom: 150),
            children: [
              //product order view
              ProductOrder(context).view(),
              //product actions
              ProductActions().view(context),
              //more product
              Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 5, left: 5),
                child: Text(
                  "This Store",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              ProductMore().show(),
              //Similar product
              Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 5, left: 5),
                child: Text(
                  "Similar Product",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              ProductSimilar(context).show(),
            ],
          ),
        ),
      ),
    );
  }
}
