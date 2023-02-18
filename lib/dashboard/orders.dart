import 'package:flutter/material.dart';
import 'package:loma/dashboard/order.dart';
import 'package:loma/dashboard/dashboard_drawer.dart';
import 'package:loma/dashboard/logout.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});
  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  responsiveText(context) {
    double viewportWidth = MediaQuery.of(context).size.width;
    if (viewportWidth > 700) {
      return 30.0;
    } else {
      return 18.0;
    }
  }

  Future<Object> _pushPage(BuildContext context) async {
    return Navigator.popAndPushNamed(context, "/Dashboard");
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
              "Orders",
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
                  Navigator.popAndPushNamed(context, "/DashboardSearch");
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  logout(context);
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                ),
                child: const Text("Logout"),
              ),
            ],
          ),
          drawer: getDrawer(context),
          body: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  "ORDER LISTING",
                  style: TextStyle(
                      color: Colors.white, fontSize: responsiveText(context)),
                ),
              ),
              Container(
                color: const Color.fromRGBO(240, 240, 240, 1),
                padding: const EdgeInsets.only(top: 20),
                child: Wrap(
                  clipBehavior: Clip.none,
                  direction: Axis.horizontal,
                  children: [
                    Order(context).card(
                        1,
                        DateTime.now(),
                        100,
                        "Lorem Ipsum",
                        "assets/1.jpg",
                        "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
                        "John Doe",
                        "John@Doe.com",
                        "34 street london avenue, appap Ghana",
                        "+234 098 45 8765"),
                    Order(context).card(
                        1,
                        DateTime.now(),
                        100,
                        "Lorem Ipsum",
                        "assets/2.jpg",
                        "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
                        "John Doe",
                        "John@Doe.com",
                        "34 street london avenue, appap Ghana",
                        "+234 098 45 8765"),
                    Order(context).card(
                        1,
                        DateTime.now(),
                        100,
                        "Lorem Ipsum",
                        "assets/3.jpg",
                        "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
                        "John Doe",
                        "John@Doe.com",
                        "34 street london avenue, appap Ghana",
                        "+234 098 45 8765"),
                    Order(context).card(
                        1,
                        DateTime.now(),
                        100,
                        "Lorem Ipsum",
                        "assets/4.jpg",
                        "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
                        "John Doe",
                        "John@Doe.com",
                        "34 street london avenue, appap Ghana",
                        "+234 098 45 8765"),
                    Order(context).card(
                        1,
                        DateTime.now(),
                        100,
                        "Lorem Ipsum",
                        "assets/5.jpg",
                        "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
                        "John Doe",
                        "John@Doe.com",
                        "34 street london avenue, appap Ghana",
                        "+234 098 45 8765"),
                    Order(context).card(
                        1,
                        DateTime.now(),
                        100,
                        "Lorem Ipsum",
                        "assets/6.jpg",
                        "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
                        "John Doe",
                        "John@Doe.com",
                        "34 street london avenue, appap Ghana",
                        "+234 098 45 8765"),
                    Order(context).card(
                        1,
                        DateTime.now(),
                        100,
                        "Lorem Ipsum",
                        "assets/7.jpg",
                        "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
                        "John Doe",
                        "John@Doe.com",
                        "34 street london avenue, appap Ghana",
                        "+234 098 45 8765"),
                    Order(context).card(
                        1,
                        DateTime.now(),
                        100,
                        "Lorem Ipsum",
                        "assets/8.jpg",
                        "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
                        "John Doe",
                        "John@Doe.com",
                        "34 street london avenue, appap Ghana",
                        "+234 098 45 8765"),
                    Order(context).card(
                        1,
                        DateTime.now(),
                        100,
                        "Lorem Ipsum",
                        "assets/9.jpg",
                        "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
                        "John Doe",
                        "John@Doe.com",
                        "34 street london avenue, appap Ghana",
                        "+234 098 45 8765"),
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
