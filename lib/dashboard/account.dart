
import 'package:flutter/material.dart';


class Account extends StatefulWidget {
  const Account({super.key});
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Image img = Image.asset("assets/cover.png");
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
      return 25.0;
    }else{
      return 18.0;
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
          title: const Text("Account", style: TextStyle(color: Colors.blue,fontFamily: 'verdana'),),
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
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
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
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: (MediaQuery.of(context).size.height / 3),
                        color: Colors.blue,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        width: responsiveViewWidth(context)/2,
                        height: responsiveViewWidth(context)/2,
                        margin: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 4.5) ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(responsiveViewWidth(context)/2),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: responsiveViewWidth(context)/2,
                          height: responsiveViewWidth(context)/2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(responsiveViewWidth(context))/2,
                            image: DecorationImage(
                              image: img.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(padding:const EdgeInsets.all(25), child:Text("Profile Name",style: TextStyle(color: Colors.blueGrey,
                            fontSize: responsiveText(context),letterSpacing: 3, fontStyle: FontStyle.italic)),),
                        Padding(padding:const EdgeInsets.all(25), child:Text("otumuyengospel@gmail.com",style: TextStyle(color: Colors.blue, fontSize: responsiveText(context),
                            letterSpacing: 3)),),
                        const Padding(padding:EdgeInsets.all(25), child:Text("Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
                            style: TextStyle(fontSize: 15)),),
                        Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                                ),
                                onPressed: (){
                                  //edit account
                                },
                                child: const Text("Edit Account", style: TextStyle(color: Colors.blue),),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                                ),
                                onPressed: (){
                                  //edit account
                                },
                                child: const Text("Delete Account", style: TextStyle(color: Colors.blue),),
                              ),
                            ),
                          ],
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
