import 'package:flutter/material.dart';

class ForgotEmail extends StatefulWidget {
  const ForgotEmail({super.key});
  @override
  State<ForgotEmail> createState() => _ForgotEmailState();
}

class _ForgotEmailState extends State<ForgotEmail> {
  final GlobalKey<FormState> _key = GlobalKey();
  String username = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("User Email", style:  TextStyle(color: Colors.blue),),
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back, color: Colors.blue,),),
      ),
      body: Center(
        child: Form(
          key: _key,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 80,
                child:Image.asset("assets/logo.png", fit: BoxFit.contain,),
              ),
              Container(
                width: 250,
                margin: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(color: Colors.grey,width: 1.2)),
                ),
                child: TextFormField(
                  initialValue: username,
                  decoration: const InputDecoration(
                    hintText: "Enter Email Address",
                    prefixIcon: Icon(Icons.person),
                    prefixIconColor: Colors.blue,
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: "EMAIL",
                    labelStyle: TextStyle(color: Colors.grey ,fontWeight: FontWeight.bold),
                    border: InputBorder.none,
                  ),
                  onChanged: (String val){
                    setState(() {
                      username = val;
                    });
                  },
                  validator: (String? val){
                    if(val == null || val.isEmpty || !RegExp("^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\\.[a-zA-Z]+").hasMatch(val)){
                      return "Enter your email";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                width: 250,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  color: Colors.blue,
                ),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(foregroundColor: const Color(0xFFFFFFFF),
                      backgroundColor:Colors.transparent, padding: const EdgeInsets.all(20)),
                  onPressed: (){
                    if(_key.currentState?.validate() != null){
                      _key.currentState?.save();
                      Navigator.pushNamed(context, "/ForgotVerify");
                    }
                  },
                  child: const Text("SUBMIT", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: (){Navigator.pushNamed(context, "/Signup");}, child: const Text("Create Account",style: TextStyle(color: Colors.blue),)),
                  TextButton(onPressed: (){Navigator.pushNamed(context, "/Login");}, child: const Text("Login Instead?",style: TextStyle(color: Colors.blue),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

