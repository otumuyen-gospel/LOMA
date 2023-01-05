import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
        body: null,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: (){},
      ),
      bottomNavigationBar: null,
    );
  }
}
