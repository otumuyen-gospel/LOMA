import 'package:flutter/material.dart';
import 'package:loma/dashboard/dashboard_drawer.dart';
import 'package:loma/dashboard/logout.dart';
import 'package:loma/dashboard/statistics.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
    return WillPopScope(
      onWillPop: () async {
        logout(context);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: const Text(
              "Dashboard",
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
                  "WELCOME BACK",
                  style: TextStyle(
                      color: Colors.white, fontSize: responsiveText(context)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  "Your Statistics",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
              Container(
                color: const Color.fromRGBO(240, 240, 240, 1),
                margin: const EdgeInsets.only(top: 20),
                child: Wrap(
                  clipBehavior: Clip.none,
                  direction: Axis.horizontal,
                  children: [
                    Statistics(context).card("assets/s1.jpg", "",
                        "Total Products", Icons.emoji_food_beverage, "10"),
                    Statistics(context).card(
                        "assets/s3.jpg", "", "Daily Search", Icons.search, "1"),
                    Statistics(context).card("assets/s2.jpg", "", "New Orders",
                        Icons.shopping_cart, "10"),
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
