import 'package:flutter/material.dart';
class ProductActions{
  view(BuildContext context){
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(40),
        clipBehavior: Clip.none,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding:const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton.icon(
                onPressed: (){},
                icon: const Icon(Icons.thumb_up_sharp,color:Colors.blue),
                label:const Text("20", style: TextStyle(color: Colors.blue),),
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
                  foregroundColor: MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton.icon(
                  onPressed: (){Navigator.pushNamed(context, "/OrderForm");},
                  icon: const Icon(Icons.shopping_cart,color:Colors.white),
                  label:const Text("Order", style: TextStyle(color: Colors.white),),
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton.icon(
                onPressed: (){},
                icon: const Icon(Icons.phone,color:Colors.blue),
                label:const Text("Call", style: TextStyle(color: Colors.blue),),
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
                  foregroundColor: MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton.icon(
                onPressed: (){},
                icon: const Icon(Icons.message,color:Colors.blue),
                label:const Text("Message", style: TextStyle(color: Colors.blue),),
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
                  foregroundColor: MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton.icon(
                onPressed: (){Navigator.pushNamed(context, "/Privacy");},
                icon: const Icon(Icons.privacy_tip,color:Colors.blue),
                label:const Text("Term & Conditions", style: TextStyle(color: Colors.blue),),
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
                  foregroundColor: MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}