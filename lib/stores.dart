import 'package:flutter/material.dart';
import 'package:loma/category_drawal.dart';
import 'package:loma/store_card.dart';

class Stores extends StatefulWidget {
  const Stores({super.key});
  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  responsiveText(context) {
    double viewportWidth = MediaQuery.of(context).size.width;
    if (viewportWidth > 700) {
      return 25.0;
    } else {
      return 18.0;
    }
  }

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
                    Navigator.popAndPushNamed(context, "/StoreSearch");
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
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  image: DecorationImage(
                    image: Image.asset(
                      "assets/m1.jpg",
                    ).image,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  child: Text(
                    "LOMA STORES",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.blueGrey,
                        fontSize: responsiveText(context)),
                  ),
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
                    fontWeight: FontWeight.w300,
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
                      StoreCard(
                              "assets/$i.jpg",
                              "Lorem Ipsum",
                              "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
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
