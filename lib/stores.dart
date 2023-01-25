
import 'package:flutter/material.dart';
import 'package:loma/ad_sponsor.dart';
import 'package:loma/store_card.dart';

import 'ad_mobile.dart';

class Stores extends StatefulWidget {
  const Stores({super.key});
  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  responsiveView(double viewportWidth){
    if(viewportWidth > 900){
      return 3;
    }else if(viewportWidth > 600){
      return 2;
    }else{
      return 1;
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
            title: const Text("LOMA", style: TextStyle(color: Colors.blue,fontFamily: 'verdana'),),
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
                  onPressed: (){Navigator.pushNamed(context, "/StoreSearch");},
                  icon: const Icon(Icons.search,color: Colors.blue,
                  )),
              TextButton(
                onPressed: (){Navigator.pushNamed(context, "/Product");},
                child: const Text("Products", style: TextStyle(color: Colors.blue,fontFamily: 'verdana'),),
              ),
              OutlinedButton(
                onPressed:  (){Navigator.pushNamed(context, "/Login");},
                style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue),),
                child: const Text("Account", style: TextStyle(color:Colors.white,fontFamily: 'verdana'),),
              ),
            ],
          ),
          drawer:  Drawer(
            //wrap product category listing in a stream builder widget
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    child: Image.asset("assets/logo.png", fit: BoxFit.contain,),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera, color: Colors.blue,),
                  title: const Text("Photography", style: TextStyle(color: Colors.blue,),),
                  onTap: (){
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.emoji_food_beverage, color: Colors.blue,),
                  title: const Text("Food and beverages", style: TextStyle(color: Colors.blue,),),
                  onTap: (){

                  },
                ),
                ListTile(
                  leading: const Icon(Icons.library_books, color: Colors.blue,),
                  title: const Text("Books", style: TextStyle(color: Colors.blue,),),
                  onTap: (){

                  },
                ),
                ListTile(
                  leading: const Icon(Icons.snowshoeing, color: Colors.blue,),
                  title: const Text("Wears & Shoes", style: TextStyle(color: Colors.blue,),),
                  onTap: (){

                  },
                ),
                ListTile(
                  leading: const Icon(Icons.computer, color: Colors.blue,),
                  title: const Text("Computer & Accessories", style: TextStyle(color: Colors.blue,),),
                  onTap: (){
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.app_shortcut, color: Colors.blue,),
                  title: const Text("Software Services", style: TextStyle(color: Colors.blue,),),
                  onTap: (){
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.draw, color: Colors.blue,),
                  title: const Text("Technical & painting & Artisan Services", style: TextStyle(color: Colors.blue,),),
                  onTap: (){
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.emoji_transportation, color: Colors.blue,),
                  title: const Text("Logistics", style: TextStyle(color: Colors.blue,),),
                  onTap: (){
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.sports, color: Colors.blue,),
                  title: const Text("Sports and Entertainment", style: TextStyle(color: Colors.blue,),),
                  onTap: (){
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.print, color: Colors.blue,),
                  title: const Text("Writing, Printing and Binding", style: TextStyle(color: Colors.blue,),),
                  onTap: (){
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.miscellaneous_services, color: Colors.blue,),
                  title: const Text("Other Services", style: TextStyle(color: Colors.blue,),),
                  onTap: (){
                  },
                ),
              ],
            ),
          ),
          body:ListView(
            padding: const EdgeInsets.only(bottom: 150),
            children: [
              AdGoogleMobileSpace(context).create(),
              Wrap(
                clipBehavior: Clip.none,
                direction: Axis.horizontal,
                children: [
                  for(int i =1; i<= 10; i++)
                    StoreCard("assets/$i.jpg", "Lorem Ipsum", "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
                        ["eggs","palte","clothes"], "Ipaja",context).card(),
                ],
              ),
            ],
          ),

          bottomSheet: BottomSheet(
            backgroundColor: Colors.white,
            clipBehavior: Clip.none,
            elevation: 5,
            enableDrag: false,
            onClosing: () {  },
            builder: (BuildContext context) {
              return SponsoredAds(context).getChildren();
            },
          ), /*LayoutBuilder(
            //wrap layout builder in a stream builder widget
            builder: (context, constraint){
              return GridView.count(
                primary: false,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 100/100,
                crossAxisCount: responsiveView(constraint.maxWidth),
                children: [
                  for(int i =1; i<= 10; i++)
                    StoreCard("assets/$i.jpg", "Lorem Ipsum", "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
                        ["eggs","palte","clothes"], "Ipaja",context).create(),
                ],
              );
            },
          ),*/

        ),
    );
  }
}
