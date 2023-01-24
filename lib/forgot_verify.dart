import 'package:flutter/material.dart';

class ForgotVerify extends StatefulWidget {
  const ForgotVerify({super.key});
  @override
  State<ForgotVerify> createState() => _ForgotVerifyState();
}

class _ForgotVerifyState extends State<ForgotVerify> {
  final GlobalKey<FormState> _key = GlobalKey();
  String verifiedPin = "1234";
  String pin = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: const Text("User Verification", style:  TextStyle(color: Colors.blue),),
            leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back, color: Colors.blue,),),
          ),
          body: ListView(
            padding: const EdgeInsets.only(top: 100,bottom: 50),
            children: [
              Center(
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
                        margin: const EdgeInsets.all(20),
                        child: const Text("Please Enter the verification code we sent to your email",
                          style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        width: 250,
                        margin: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          border: Border.fromBorderSide(BorderSide(color: Colors.grey,width: 1.2)),
                        ),
                        child: TextFormField(
                          initialValue: pin,
                          decoration: const InputDecoration(
                            hintText: "Enter Pin",
                            prefixIcon: Icon(Icons.key),
                            prefixIconColor: Colors.blue,
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: "PIN CODE",
                            labelStyle: TextStyle(color: Colors.grey ,fontWeight: FontWeight.bold),
                            border: InputBorder.none,
                          ),
                          onChanged: (String val){
                            setState(() {
                              pin = val;
                            });
                          },
                          validator: (String? val){
                            if(val == null || val.isEmpty || val != verifiedPin){
                              return "Enter the correct pin";
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
                              Navigator.pushNamed(context, "/ForgotChange");
                            }
                          },
                          child: const Text("VERIFY", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
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
            ],
          ),
        ),
    );
  }
}

