import 'package:flutter/material.dart';

class ProductSearch extends StatefulWidget {
  const ProductSearch({super.key});
  @override
  State<ProductSearch> createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  final GlobalKey<FormState> _key = GlobalKey();
  String searchTerm = "";
  String errorMsg = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/cover.png"), fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 255, 0.9),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Product Search", style:  TextStyle(color: Colors.blue),),
          leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back, color: Colors.blue,),),
        ),
        body: Center(
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(errorMsg, style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 220,
                      decoration: const BoxDecoration(
                        border: Border.fromBorderSide(BorderSide(color: Colors.white,width: 1.2)),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: TextFormField(
                        initialValue: searchTerm,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "Search Term",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                        onChanged: (String val){
                          setState(() {
                            searchTerm = val;
                          });
                        },
                        validator: (String? val){
                          if(val == null || val.isEmpty){
                            setState(() {
                              errorMsg = "Please Enter Your Search Term";
                            });
                            return;//to set the error text of a text form field return an error message here
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        color: Colors.blue,
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      child: IconButton(
                        onPressed: (){
                          if(_key.currentState?.validate() != null){
                            _key.currentState?.save();
                          }
                        },
                        icon: const Icon(Icons.search,color: Colors.white,),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
          ),
        ),
      );

  }
}

