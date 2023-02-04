
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loma/dashboard/filepicker.dart';
import 'package:regexed_validator/regexed_validator.dart';

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
  _addTag(String tag){
    if(tagsWidget.length <= 2) {
      var chip = Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Chip(label: Text(tag,style: const TextStyle(color: Colors.blue),), backgroundColor: Colors.white,
          onDeleted: (){
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
  List<Widget> tagList(){
    return tagsWidget;
  }
  responsiveViewWidth(context) {
    double width = 0;
    double viewportWidth = MediaQuery.of(context).size.width;
    if (viewportWidth > 600) {
      width = (viewportWidth / 2);
    } else{
      width = (viewportWidth / 1);
    }
    return width;
  }
  responsiveText(context){
    double viewportWidth = MediaQuery.of(context).size.width;
    if(viewportWidth > 700){
      return 40.0;
    }else{
      return 28.0;
    }
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Edit Store", style: TextStyle(color: Colors.blue,fontFamily: 'verdana'),),
          leading: Builder(builder: (context){
            return IconButton(
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, color: Colors.blue,),
            );
          }),
          actions: [
            IconButton(
              onPressed: (){
                Navigator.pushNamed(context, "/DashboardSearch");
              },
              icon: const Icon(Icons.search, color: Colors.blue,),
            ),
            ElevatedButton(
              onPressed: (){Navigator.pushNamed(context, "/Product");},
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              child: const Text("Logout"),
            ),
          ],
        ),
        drawer:  Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: ListTile(
                  leading: CircleAvatar(backgroundImage:Image.asset("assets/1.jpg").image,),
                  title: const Text("Profile Name", style: TextStyle(color: Colors.blue,),),
                  subtitle: const Text("Profile description", style: TextStyle(color: Colors.grey,),),
                  onTap: (){
                    //take user to account page
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.dashboard, color: Colors.blue,),
                title: const Text("Dashboard", style: TextStyle(color: Colors.blue,),),
                onTap: (){
                  Navigator.pushNamed(context, "/Dashboard");
                },
              ),
              ListTile(
                leading: const Icon(Icons.location_on, color: Colors.blue,),
                title: const Text("Manage Location", style: TextStyle(color: Colors.blue,),),
                onTap: (){
                },
              ),
              ListTile(
                leading: const Icon(Icons.manage_accounts, color: Colors.blue,),
                title: const Text("Manage Account", style: TextStyle(color: Colors.blue,),),
                onTap: (){
                },
              ),
              const Divider(color: Colors.grey),
              ListTile(
                leading: const Icon(Icons.store, color: Colors.blue,),
                title: const Text("Your Store", style: TextStyle(color: Colors.blue,),),
                onTap: (){
                  Navigator.pushNamed(context, "/Store");
                },
              ),
              ListTile(
                leading: const Icon(Icons.emoji_food_beverage, color: Colors.blue,),
                title: const Text("New Product", style: TextStyle(color: Colors.blue,),),
                onTap: (){

                },
              ),
              ListTile(
                leading: const Icon(Icons.list, color: Colors.blue,),
                title: const Text("Manage Products List", style: TextStyle(color: Colors.blue,),),
                onTap: (){
                },
              ),
              ListTile(
                leading: const Icon(Icons.book, color: Colors.blue,),
                title: const Text("Orders", style: TextStyle(color: Colors.blue,),),
                onTap: (){

                },
              ),
              ListTile(
                leading: const Icon(Icons.call, color: Colors.blue,),
                title: const Text("Manage Calls", style: TextStyle(color: Colors.blue,),),
                onTap: (){

                },
              ),
              ListTile(
                leading: const Icon(Icons.sms, color: Colors.blue,),
                title: const Text("Manage Message", style: TextStyle(color: Colors.blue,),),
                onTap: (){
                },
              ),
              ListTile(
                leading: const Icon(Icons.thumb_up_sharp, color: Colors.blue,),
                title: const Text("See Likes", style: TextStyle(color: Colors.blue,),),
                onTap: (){
                },
              ),
              const Divider(color: Colors.grey),
              ListTile(
                leading: const Icon(Icons.ads_click, color: Colors.blue,),
                title: const Text("Advertise with us", style: TextStyle(color: Colors.blue,),),
                onTap: (){
                },
              ),
              ListTile(
                leading: const Icon(Icons.search_off, color: Colors.blue,),
                title: const Text("Turn on Global Search", style: TextStyle(color: Colors.blue,),),
                onTap: (){
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications, color: Colors.blue,),
                title: const Text("Paid Notification", style: TextStyle(color: Colors.blue,),),
                onTap: (){
                },
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
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
                    height: MediaQuery.of(context).size.height,
                    color:const Color.fromRGBO(240, 240, 240, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FutureBuilder<dynamic>(
                            future: future,
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                                    child: Text(snapshot.error.toString(),
                                      style: const TextStyle(color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        fontFamily: "verdana",),)
                                );
                              }
                              if (snapshot.connectionState != ConnectionState.done) {
                                return Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                                  child: const CircularProgressIndicator(color: Colors
                                      .blue,),
                                );
                              }
                              if (!snapshot.hasData) {
                                img = Image.asset("assets/cover.png");
                                return Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  width: responsiveViewWidth(context)/3,
                                  height: responsiveViewWidth(context)/3,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey, width: 0.5),
                                    borderRadius: BorderRadius.circular(responsiveViewWidth(context)/3),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: responsiveViewWidth(context)/3,
                                    height: responsiveViewWidth(context)/3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(responsiveViewWidth(context))/3,
                                      image: DecorationImage(
                                        image: img.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                var path = snapshot.data as dynamic;
                                if((path as String).isNotEmpty){
                                  img = Image.file(File(path));
                                }
                                return Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  width: responsiveViewWidth(context)/3,
                                  height: responsiveViewWidth(context)/3,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey, width: 0.5),
                                    borderRadius: BorderRadius.circular(responsiveViewWidth(context)/3),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: responsiveViewWidth(context)/3,
                                    height: responsiveViewWidth(context)/3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(responsiveViewWidth(context))/3,
                                      image: DecorationImage(
                                        image: img.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            }
                        ),

                        Container(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.white),
                            ),
                            onPressed: (){
                              setState(() {
                                future = picker.filePicker();
                              });
                            },
                            child: const Text("Upload Photo", style: TextStyle(color: Colors.blue),),
                          ),
                        ),


                        //set Business tags
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(padding: EdgeInsets.only(bottom: 10),
                              child: Text("Enter your business tag(3 maximum)"),),
                            Form(
                              key: _key2,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.tag, color: Colors.blue,),
                                ),
                                onFieldSubmitted: (val){
                                  if(val.isNotEmpty){
                                    setState(() {
                                      _addTag(val);
                                    });
                                  }
                                },

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15, bottom: 15),
                              child: Wrap(
                                direction: Axis.horizontal,
                                children :tagList(),
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
                          Padding(padding:const EdgeInsets.all(10), child:Text("Edit Store information",style: TextStyle(color: Colors.blue, fontSize: responsiveText(context)/2,
                              letterSpacing: 3)),),
                          const Text("Store Details", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                          Container(
                            margin: const EdgeInsets.only(top: 5,bottom: 20),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [

                                Container(
                                  width: responsiveViewWidth(context),
                                  margin: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    border: Border.fromBorderSide(BorderSide(color: Colors.grey,width: 1.2)),
                                  ),
                                  child: TextFormField(
                                    initialValue: description,
                                    maxLines: 3,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.description, color: Colors.blue,),
                                      labelText: "Description",
                                      labelStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (String val){
                                      setState(() {
                                        description = val;
                                      });
                                    },
                                    validator: (String? val){
                                      if(val == null || val.isEmpty){
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
                                    border: Border.fromBorderSide(BorderSide(color: Colors.grey,width: 1.2)),
                                  ),
                                  child: TextFormField(
                                    initialValue: name,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.business, color: Colors.blue,),
                                      labelText: "Business Name",
                                      labelStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (String val){
                                      setState(() {
                                        name = val;
                                      });
                                    },
                                    validator: (String? val){
                                      if(val == null || val.isEmpty || validator.name(val)){
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
                                    border: Border.fromBorderSide(BorderSide(color: Colors.grey,width: 1.2)),
                                  ),
                                  child: TextFormField(
                                    initialValue: address,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.location_city, color: Colors.blue,),
                                      labelText: "Business Full Address",
                                      labelStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (String val){
                                      setState(() {
                                        address = val;
                                      });
                                    },
                                    validator: (String? val){
                                      if(val == null || val.isEmpty){
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
                                    border: Border.fromBorderSide(BorderSide(color: Colors.grey,width: 1.2)),
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    initialValue: phone,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.phone, color: Colors.blue,),
                                      labelText: "Business Contact Number",
                                      labelStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (String val){
                                      setState(() {
                                        phone = val;
                                      });
                                    },
                                    validator: (String? val){
                                      if(val == null || val.isEmpty ||!validator.phone(val)){
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
                              style: OutlinedButton.styleFrom(foregroundColor: const Color(0xFFFFFFFF),
                                  backgroundColor:Colors.transparent, padding: const EdgeInsets.all(20)),
                              onPressed: (){
                                if(_key.currentState?.validate() != null){
                                  _key.currentState?.save();
                                }
                              },
                              child: const Text("Update", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
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
    );
  }
}
