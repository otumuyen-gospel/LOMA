import 'package:flutter/material.dart';
import 'package:loma/dashboard/order.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text(
            "Orders ",
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
                Navigator.pushNamed(context, "/DashboardSearch");
              },
              icon: const Icon(
                Icons.search,
                color: Colors.blue,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/Product");
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              child: const Text("Logout"),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: Image.asset("assets/1.jpg").image,
                  ),
                  title: const Text(
                    "Profile Name",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  subtitle: const Text(
                    "Profile description",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/Account");
                  },
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.dashboard,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Dashboard",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/Dashboard");
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.location_on,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Manage Location",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/Location");
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.manage_accounts,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Manage Account",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/Account");
                },
              ),
              const Divider(color: Colors.grey),
              ListTile(
                leading: const Icon(
                  Icons.store,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Your Store",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/Store");
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.emoji_food_beverage,
                  color: Colors.blue,
                ),
                title: const Text(
                  "New Product",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/NewProduct");
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.list,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Manage Products List",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/ProductListing");
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.book,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Orders",
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
    );
  }
}
