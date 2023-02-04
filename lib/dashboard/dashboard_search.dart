import 'package:flutter/material.dart';

class DashboardSearch extends StatefulWidget {
  const DashboardSearch({super.key});
  @override
  State<DashboardSearch> createState() => _DashboardSearchState();
}

class _DashboardSearchState extends State<DashboardSearch> {
  final GlobalKey<FormState> _key = GlobalKey();
  String searchTerm = "";
  String errorMsg = "";
  responsiveViewWidth(){
    double viewportWidth = MediaQuery.of(context).size.width;
    if(viewportWidth > 700){
      return viewportWidth * 0.4;
    }else{
      return viewportWidth * 0.7;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Search", style:  TextStyle(color: Colors.blue),),
          leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back, color: Colors.blue,),),
        ),
        body: Center(
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(errorMsg, style: const TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      width: responsiveViewWidth(),
                      decoration: const BoxDecoration(
                        border: Border.fromBorderSide(BorderSide(color: Colors.blue,width: 1.2)),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: TextFormField(
                        initialValue: searchTerm,
                        style: const TextStyle(color: Colors.blue),
                        decoration: const InputDecoration(
                          hintText: "Search Term",
                          hintStyle: TextStyle(color: Colors.white),
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
                      height: 60,
                      padding: const EdgeInsets.only(left: 5, right: 5),
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

