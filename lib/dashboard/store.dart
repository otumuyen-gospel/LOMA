import 'package:flutter/material.dart';

class Store extends StatefulWidget {
  const Store({super.key});
  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text(
            "Store",
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
                  // on store page
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
                onTap: () {},
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
                "VIEWING YOUR STORE",
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
                              image: Image.asset("assets/s1.jpg").image,
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
                          child: Text("Lorem Ipsum",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: responsiveText(context),
                                  letterSpacing: 3)),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
                              style: TextStyle(fontSize: 15)),
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          children: [
                            for (String tags in ["eggs", "palte", "clothes"])
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Chip(
                                  label: Text(
                                    tags,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.blue,
                                ),
                              )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, "/EditStore");
                            },
                            child: const Text(
                              "Edit Store",
                              style: TextStyle(color: Colors.blue),
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
    );
  }
}