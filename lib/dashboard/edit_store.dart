import 'package:flutter/material.dart';
import 'package:loma/dashboard/filepicker.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:loma/dashboard/dashboard_drawer.dart';
import 'package:loma/dashboard/logout.dart';

class EditStore extends StatefulWidget {
  const EditStore({super.key});
  @override
  State<EditStore> createState() => _EditStoreState();
}

class _EditStoreState extends State<EditStore> {
  final GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<FormState> _key2 = GlobalKey();
  String description = "";
  String address = "";
  String name = "";
  String phone = "";
  List<String> tags = [];
  List<Padding> tagsWidget = [];
  String tagValue = "";
  var picker = SystemFilePicker();
  Future future = Future(() => null);
  Image img = Image.asset("assets/cover.png");
  var uploadPath = "";
  _addTag(String tag) {
    if (tagsWidget.length <= 2) {
      var chip = Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Chip(
          label: Text(
            tag,
            style: const TextStyle(color: Colors.blue),
          ),
          backgroundColor: Colors.white,
          onDeleted: () {
            setState(() {
              var pos = tags.indexOf(tag);
              tags.removeAt(pos);
              tagsWidget.removeAt(pos);
            });
          },
        ),
      );
      tags.add(tag);
      tagsWidget.add(chip);
    }
  }

  List<Widget> tagList() {
    return tagsWidget;
  }

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

  Future<Object> _pushPage(BuildContext context) async {
    return Navigator.popAndPushNamed(context, "/Store");
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
              "Edit Store",
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
                  "EDIT STORE",
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
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 100, 0, 0),
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
                                  uploadPath = snapshot.data as String;
                                  if (uploadPath.isNotEmpty) {
                                    img = Image.network(uploadPath);
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

                          //set Business tags
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child:
                                    Text("Enter your business tag(3 maximum)"),
                              ),
                              Form(
                                key: _key2,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.tag,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  onFieldSubmitted: (val) {
                                    if (val.isNotEmpty) {
                                      setState(() {
                                        _addTag(val);
                                      });
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 15),
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  children: tagList(),
                                ),
                              )
                            ],
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
                              child: Text("Edit Store information",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      letterSpacing: 3)),
                            ),
                            const Text(
                              "Store Details",
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
                                        labelStyle:
                                            TextStyle(color: Colors.grey),
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
                                        labelText: "Business Name",
                                        labelStyle:
                                            TextStyle(color: Colors.grey),
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
                                          return "Enter Business name";
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
                                      initialValue: address,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.location_city,
                                          color: Colors.blue,
                                        ),
                                        labelText: "Business Full Address",
                                        labelStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (String val) {
                                        setState(() {
                                          address = val;
                                        });
                                      },
                                      validator: (String? val) {
                                        if (val == null || val.isEmpty) {
                                          return "Enter address";
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
                                      initialValue: phone,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color: Colors.blue,
                                        ),
                                        labelText: "Business Contact Number",
                                        labelStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (String val) {
                                        setState(() {
                                          phone = val;
                                        });
                                      },
                                      validator: (String? val) {
                                        if (val == null ||
                                            val.isEmpty ||
                                            !validator.phone(val)) {
                                          return "Enter Number";
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
      ),
    );
  }
}
