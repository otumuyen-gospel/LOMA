import 'package:flutter/material.dart';
class ProductActions{
  view(){
    return Wrap(
      direction: Axis.horizontal,
      clipBehavior: Clip.none,
      spacing: 30,
      children: [
        ElevatedButton.icon(
          onPressed: (){},
          icon: const Icon(Icons.thumb_up_sharp,color:Colors.blue),
          label:const Text("20", style: TextStyle(color: Colors.blue),),
          style: ButtonStyle(
            backgroundColor:MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
            foregroundColor: MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
          ),
        ),
        ElevatedButton.icon(
          onPressed: (){},
          icon: const Icon(Icons.shopping_cart,color:Colors.white),
          label:const Text("Order", style: TextStyle(color: Colors.white),),
        ),
        ElevatedButton.icon(
          onPressed: (){},
          icon: const Icon(Icons.phone_callback,color:Colors.blue),
          label:const Text("Call", style: TextStyle(color: Colors.blue),),
          style: ButtonStyle(
            backgroundColor:MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
            foregroundColor: MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
          ),
        ),
        ElevatedButton.icon(
          onPressed: (){},
          icon: const Icon(Icons.message,color:Colors.blue),
          label:const Text("Message", style: TextStyle(color: Colors.blue),),
          style: ButtonStyle(
            backgroundColor:MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
            foregroundColor: MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
          ),
        ),
        ElevatedButton.icon(
          onPressed: (){},
          icon: const Icon(Icons.privacy_tip,color:Colors.blue),
          label:const Text("Term & Conditions", style: TextStyle(color: Colors.blue),),
          style: ButtonStyle(
            backgroundColor:MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
            foregroundColor: MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
          ),
        ),
      ],
    );
  }
}