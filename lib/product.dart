import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  Navigator.pushNamed(context, "/ProductSearch");
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.blue,
                )),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/Stores");
              },
              child: const Text(
                "Stores",
                style: TextStyle(color: Colors.blue, fontFamily: 'verdana'),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/Login");
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
        drawer: Drawer(
          //wrap product category listing in a stream builder widget
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo_camera,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Photography",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.emoji_food_beverage,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Food and beverages",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.library_books,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Books",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.snowshoeing,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Wears & Shoes",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.computer,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Computer & Accessories",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.app_shortcut,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Software Services",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.draw,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Technical & painting & Artisan Services",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.emoji_transportation,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Logistics",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.sports,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Sports and Entertainment",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.print,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Writing, Printing and Binding",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.miscellaneous_services,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Other Services",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
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
                        color: Colors.white, fontSize: responsiveText(context)),
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      foregroundColor: MaterialStatePropertyAll(Colors.grey),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/Signup");
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
    );
  }
}
