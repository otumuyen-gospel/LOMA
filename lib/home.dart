
import 'package:flutter/material.dart';
import 'package:loma/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  responsiveView(double viewportWidth){
    if(viewportWidth > 1100){
      return 3;
    }else if(viewportWidth > 800 && viewportWidth < 1100){
      return 2;
    }else{
      return 1;
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            TextButton(
                onPressed: (){},
                child: const Text("Stores", style: TextStyle(color: Colors.blue,fontFamily: 'verdana'),),
            ),
            OutlinedButton(
                onPressed:  (){},
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
                  height: 150,
                  child: Image.asset("assets/logo.png", fit: BoxFit.contain,),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text("Photography"),
                onTap: (){
                },
              ),
              ListTile(
                leading: const Icon(Icons.emoji_food_beverage),
                title: const Text("Food and beverages"),
                onTap: (){

                },
              ),
              ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text("Books"),
                onTap: (){

                },
              ),
              ListTile(
                leading: const Icon(Icons.snowshoeing),
                title: const Text("Wears & Shoes"),
                onTap: (){

                },
              ),
              ListTile(
                leading: const Icon(Icons.computer),
                title: const Text("Computer & Accessories"),
                onTap: (){
                },
              ),
              ListTile(
                leading: const Icon(Icons.app_shortcut),
                title: const Text("Software Services"),
                onTap: (){
                },
              ),
              ListTile(
                leading: const Icon(Icons.draw),
                title: const Text("Technical & painting & Artisan Services"),
                onTap: (){
                },
              ),
              ListTile(
                leading: const Icon(Icons.emoji_transportation),
                title: const Text("Logistics"),
                onTap: (){
                },
              ),
              ListTile(
                leading: const Icon(Icons.sports),
                title: const Text("Sports and Entertainment"),
                onTap: (){
                },
              ),
              ListTile(
                leading: const Icon(Icons.print),
                title: const Text("Writing, Printing and Binding"),
                onTap: (){
                },
              ),
              ListTile(
                leading: const Icon(Icons.miscellaneous_services),
                title: const Text("Other Services"),
                onTap: (){
                },
              ),
            ],
          ),
        ),
        body: LayoutBuilder(
          //wrap layout builder in a stream builder widget
          builder: (context, constraint){
            return GridView.count(
              primary: false,
              reverse: true,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: responsiveView(constraint.maxWidth),
              children: [
                for(int i =1; i<= 10; i++)
                  ProductCard("assets/$i.jpg", "Lorem Ipsum", "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
                      20, "\$100", "Ipaja").create(),
              ],
            );
          },
        ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: (){},
      ),
      bottomNavigationBar: null,
    );
  }
}
