
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
        drawer: const Drawer(

        ),
        //wrap layoutbuilder in a streambuilder
        body: LayoutBuilder(
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
