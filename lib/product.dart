import 'package:flutter/material.dart';
import 'package:loma/category_drawal.dart';
import 'package:loma/product_card.dart';

class Product extends StatefulWidget {
  const Product({super.key});
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  responsiveText(context) {
    double viewportWidth = MediaQuery.of(context).size.width;
    if (viewportWidth > 700) {
      return 25.0;
    } else {
      return 18.0;
    }
  }

  Future<bool> _pushPage(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Exit App"),
            content: const Text("Sure you want to Exit?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("No"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Yes"),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _pushPage(context);
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
                  Navigator.popAndPushNamed(context, "/Stores");
                },
                child: const Text(
                  "Stores",
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
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 50, bottom: 50),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 30,
                  children: [
                    Text(
                      "WELCOME TO LOMA",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: responsiveText(context)),
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        foregroundColor: MaterialStatePropertyAll(Colors.grey),
                      ),
                      onPressed: () {
                        Navigator.popAndPushNamed(context, "/Signup");
                      },
                      child: Text(
                        "JOIN US",
                        style: TextStyle(fontSize: responsiveText(context)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: const Text(
                  "We Promote Local Services, Businesses and products Near You",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                color: const Color.fromRGBO(240, 240, 240, 1),
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(bottom: 20),
                child: Wrap(
                  clipBehavior: Clip.none,
                  direction: Axis.horizontal,
                  children: [
                    for (int i = 1; i <= 10; i++)
                      ProductCard(
                              "assets/$i.jpg",
                              "Lorem Ipsum",
                              "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
                              20,
                              "\$100",
                              "Ipaja",
                              context)
                          .card(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
