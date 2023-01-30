
import 'package:flutter/material.dart';
import 'package:loma/dashboard/statistics.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
          title: const Text("Dashboard", style: TextStyle(color: Colors.blue,fontFamily: 'verdana'),),
          leading: Builder(builder: (context){
            return IconButton(
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, color: Colors.blue,),
            );
          }),
          actions: [
            ElevatedButton.icon(
                onPressed: (){},
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    foregroundColor: MaterialStatePropertyAll(Colors.blue)
                ),
                icon: const Icon(Icons.search, color: Colors.blue,),
                label: const Text("Search"),
            ),
            ElevatedButton.icon(
              onPressed: (){Navigator.pushNamed(context, "/Product");},
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  foregroundColor: MaterialStatePropertyAll(Colors.blue)
              ),
              icon: const Icon(Icons.home, color: Colors.blue,),
              label: const Text("Log out"),
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
          padding: const EdgeInsets.only(top: 20),
          children: [
            Container(
              color: const Color.fromRGBO(255, 255, 255, 0.9),
              child: Wrap(
                clipBehavior: Clip.none,
                direction: Axis.horizontal,
                children: [
                  Statistics(context).product(),
                  Statistics(context).search(),
                  Statistics(context).order(),
                  Statistics(context).likes(),
                  Statistics(context).calls(),
                  Statistics(context).messages(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
