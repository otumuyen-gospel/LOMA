import 'package:flutter/material.dart';
import 'package:loma/dashboard/dashboard_drawer.dart';
import 'package:loma/dashboard/logout.dart';

class Location extends StatefulWidget {
  const Location({super.key});
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  responsiveViewWidth(context) {
    double width = 0;
    double viewportWidth = MediaQuery.of(context).size.width;
    if (viewportWidth > 600) {
      width = (viewportWidth / 2);
    } else {
      width = (viewportWidth / 1);
    }
    return width;
  }

  responsiveViewHeight(context) {
    double height = 0;
    double viewportWidth = MediaQuery.of(context).size.width;
    if (viewportWidth > 600) {
      height = MediaQuery.of(context).size.height * 1.0; // full height
    } else {
      height = MediaQuery.of(context).size.height * 0.9;
    }
    return height;
  }

  responsiveAlignment(context) {
    MainAxisAlignment align = MainAxisAlignment.spaceEvenly;
    double viewportWidth = MediaQuery.of(context).size.width;
    if (viewportWidth > 600) {
      align = MainAxisAlignment.spaceEvenly; // full height
    } else {
      align = MainAxisAlignment.spaceBetween;
    }
    return align;
  }

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
              "Location",
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
                  "YOUR LOCATION",
                  style: TextStyle(
                      color: Colors.white, fontSize: responsiveText(context)),
                ),
              ),
              Container(
                clipBehavior: Clip.none,
                child: Wrap(
                  clipBehavior: Clip.none,
                  direction: Axis.horizontal,
                  children: [
                    //Left side
                    Container(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      width: responsiveViewWidth(context),
                      child: Column(
                        mainAxisAlignment: responsiveAlignment(context),
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: responsiveViewWidth(context),
                            height: (responsiveViewHeight(context) *
                                2 /
                                3), //two third of screen height
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: Image.asset("assets/m1.jpg").image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //right side
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom: 20),
                      width: responsiveViewWidth(context),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text("Ipaja",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: responsiveText(context),
                                    letterSpacing: 3,
                                    fontStyle: FontStyle.italic)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text("Refresh Location",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: responsiveText(context),
                                    letterSpacing: 3)),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                "When you click the button below the system automatically capture your"
                                " current location as your primary business location."
                                " try to refresh if the location displayed above is not your primary "
                                " business location and ensure you're within your primary business location.",
                                style: TextStyle(fontSize: 15)),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton.icon(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                              ),
                              onPressed: () {},
                              icon: const Icon(Icons.location_on,
                                  color: Colors.grey, size: 25),
                              label: const Text(
                                "Refresh",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
