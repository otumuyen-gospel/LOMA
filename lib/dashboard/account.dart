import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loma/dashboard/filepicker.dart';
import 'package:regexed_validator/regexed_validator.dart';

class Account extends StatefulWidget {
  const Account({super.key});
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<FormState> _key2 = GlobalKey();
  String description = "";
  String name = "";
  String email = "";
  String password = "";
  String confirm = "";
  var picker = SystemFilePicker();
  Future future = Future(() => null);
  Image img = Image.asset("assets/cover.png");

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
    return MediaQuery.of(context).size.height * 1.0;
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
            "Account",
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
                    Navigator.pushNamed(context, "");
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
                  Navigator.pushNamed(context, "");
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
                "MANAGE ACCOUNT",
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
                    padding: const EdgeInsets.all(10),
                    width: responsiveViewWidth(context),
                    child: Column(
                      mainAxisAlignment: responsiveAlignment(context),
                      children: [
                        FutureBuilder<dynamic>(
                            future: future,
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Container(
                                    alignment: Alignment.center,
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 100, 0, 0),
                                    child: Text(
                                      snapshot.error.toString(),
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        fontFamily: "verdana",
                                      ),
                                    ));
                              }
                              if (snapshot.connectionState !=
                                  ConnectionState.done) {
                                return Container(
                                  alignment: Alignment.center,
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 100, 0, 0),
                                  child: const CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                );
                              }
                              if (!snapshot.hasData) {
                                img = Image.asset("assets/cover.png");
                                return Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  width: responsiveViewWidth(context) / 2,
                                  height: responsiveViewWidth(context) / 2,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5),
                                    borderRadius: BorderRadius.circular(
                                        responsiveViewWidth(context) / 2),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: responsiveViewWidth(context) / 2,
                                    height: responsiveViewWidth(context) / 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                              responsiveViewWidth(context)) /
                                          3,
                                      image: DecorationImage(
                                        image: img.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                var path = snapshot.data as dynamic;
                                if ((path as String).isNotEmpty) {
                                  img = Image.file(File(path));
                                }
                                return Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  width: responsiveViewWidth(context) / 2,
                                  height: responsiveViewWidth(context) / 2,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5),
                                    borderRadius: BorderRadius.circular(
                                        responsiveViewWidth(context) / 2),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: responsiveViewWidth(context) / 2,
                                    height: responsiveViewWidth(context) / 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                              responsiveViewWidth(context)) /
                                          3,
                                      image: DecorationImage(
                                        image: img.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            }),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                future = picker.filePicker();
                              });
                            },
                            child: const Text(
                              "Upload Photo",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),

                        // change password
                        Form(
                          key: _key2,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("Change password",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                        letterSpacing: 3)),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 5, bottom: 20),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Container(
                                      width: responsiveViewWidth(context),
                                      margin: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                        border: Border.fromBorderSide(
                                            BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                      ),
                                      child: TextFormField(
                                        initialValue: name,
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: Colors.blue,
                                          ),
                                          labelText: "New Password",
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (String val) {
                                          setState(() {
                                            password = val;
                                          });
                                        },
                                        validator: (String? val) {
                                          if (val == null ||
                                              val.isEmpty ||
                                              !validator.password(val)) {
                                            return "Enter Strong password";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: responsiveViewWidth(context),
                                      margin: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                        border: Border.fromBorderSide(
                                            BorderSide(
                                                color: Colors.grey,
                                                width: 1.2)),
                                      ),
                                      child: TextFormField(
                                        initialValue: name,
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: Colors.blue,
                                          ),
                                          labelText: "Confirm Password",
                                          labelStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (String val) {
                                          setState(() {
                                            confirm = val;
                                          });
                                        },
                                        validator: (String? val) {
                                          if (val == null || val != password) {
                                            return "confirm password";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: responsiveViewWidth(context),
                                margin: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  color: Colors.blue,
                                ),
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      foregroundColor: const Color(0xFFFFFFFF),
                                      backgroundColor: Colors.transparent,
                                      padding: const EdgeInsets.all(20)),
                                  onPressed: () {
                                    if (_key2.currentState?.validate() !=
                                        null) {
                                      _key2.currentState?.save();
                                    }
                                  },
                                  child: const Text(
                                    "Change Password",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //right side
                  Container(
                    alignment: Alignment.center,
                    width: responsiveViewWidth(context),
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Form(
                      key: _key,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Edit Account",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    letterSpacing: 3)),
                          ),
                          const Text(
                            "Account Details",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 20),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  width: responsiveViewWidth(context),
                                  margin: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    border: Border.fromBorderSide(BorderSide(
                                        color: Colors.grey, width: 1.2)),
                                  ),
                                  child: TextFormField(
                                    initialValue: description,
                                    maxLines: 3,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.description,
                                        color: Colors.blue,
                                      ),
                                      labelText: "Description",
                                      labelStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (String val) {
                                      setState(() {
                                        description = val;
                                      });
                                    },
                                    validator: (String? val) {
                                      if (val == null || val.isEmpty) {
                                        return "Enter Description";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Container(
                                  width: responsiveViewWidth(context),
                                  margin: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    border: Border.fromBorderSide(BorderSide(
                                        color: Colors.grey, width: 1.2)),
                                  ),
                                  child: TextFormField(
                                    initialValue: name,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.business,
                                        color: Colors.blue,
                                      ),
                                      labelText: "Profile Name",
                                      labelStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (String val) {
                                      setState(() {
                                        name = val;
                                      });
                                    },
                                    validator: (String? val) {
                                      if (val == null ||
                                          val.isEmpty ||
                                          validator.name(val)) {
                                        return "Enter Profile name";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Container(
                                  width: responsiveViewWidth(context),
                                  margin: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    border: Border.fromBorderSide(BorderSide(
                                        color: Colors.grey, width: 1.2)),
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    initialValue: email,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        color: Colors.blue,
                                      ),
                                      labelText: "Email",
                                      labelStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (String val) {
                                      setState(() {
                                        email = val;
                                      });
                                    },
                                    validator: (String? val) {
                                      if (val == null ||
                                          val.isEmpty ||
                                          !validator.email(val)) {
                                        return "Enter Email";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: responsiveViewWidth(context),
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              color: Colors.blue,
                            ),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color(0xFFFFFFFF),
                                  backgroundColor: Colors.transparent,
                                  padding: const EdgeInsets.all(20)),
                              onPressed: () {
                                if (_key.currentState?.validate() != null) {
                                  _key.currentState?.save();
                                }
                              },
                              child: const Text(
                                "Update",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            width: responsiveViewWidth(context),
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.red, width: 0.5)),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Text(
                                        "I don't want to operate this account anymore, delete my account"),
                                  ),
                                  ElevatedButton(
                                    style: const ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll(Colors.red),
                                      foregroundColor: MaterialStatePropertyAll(
                                          Colors.white),
                                    ),
                                    onPressed: () {},
                                    child: const Text("DELETE ACCOUNT"),
                                  )
                                ]),
                          ),
                        ],
                      ),
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
