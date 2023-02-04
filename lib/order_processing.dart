import 'package:flutter/material.dart';
import 'package:regexed_validator/regexed_validator.dart';
enum Gender{male,female,others}
class OrderForm extends StatefulWidget {
  const OrderForm({super.key});
  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final GlobalKey<FormState> _key = GlobalKey();
  String size = "";
  int qty = 0;
  String description = "";
  String email = "";
  String address = "";
  String name = "";
  String phone = "";
  String postalCode = "";
  Gender gender = Gender.male;
  responsiveText(){
    double viewportWidth = MediaQuery.of(context).size.width;
    if(viewportWidth > 700){
      return 40.0;
    }else{
      return 28.0;
    }
  }
  responsiveViewWidth(){
    double viewportWidth = MediaQuery.of(context).size.width;
    if(viewportWidth > 700){
      return viewportWidth * 0.4;
    }else{
      return viewportWidth * 0.9;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Place Order", style:  TextStyle(color: Colors.blue),),
          leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back, color: Colors.blue,),),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 25,bottom: 50),
          children: [
            Center(
              child: Form(
                key: _key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding:const EdgeInsets.all(10), child:Text("Lorem Ipsum dolor",style: TextStyle(color: Colors.blue, fontSize: responsiveText(),
                        letterSpacing: 3)),),
                    const Text("Product Details", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                    Container(
                      margin: const EdgeInsets.only(top: 5,bottom: 20),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            width: responsiveViewWidth(),
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              border: Border.fromBorderSide(BorderSide(color: Colors.grey,width: 1.2)),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              initialValue: qty.toString(),
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.numbers, color: Colors.blue,),
                                labelText: "Quantity(Optional)",
                                labelStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              onChanged: (String val){
                                setState(() {
                                  qty = val.trim() as int;
                                });
                              },
                              validator: (String? val){
                                if(val == null){
                                  return "quantity must be a number";
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            width: responsiveViewWidth(),
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              border: Border.fromBorderSide(BorderSide(color: Colors.grey,width: 1.2)),
                            ),
                            child: TextFormField(
                              initialValue: description,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.description, color: Colors.blue,),
                                labelText: "Further Description",
                                labelStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              onChanged: (String val){
                                setState(() {
                                  description = val;
                                });
                              },
                              validator: (String? val){
                                if(val == null || val.isEmpty){
                                  return "Enter Further Description";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Text("Personal Details", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                    Container(
                      margin: const EdgeInsets.only(top: 5,bottom: 20),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            width: responsiveViewWidth(),
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              border: Border.fromBorderSide(BorderSide(color: Colors.grey,width: 1.2)),
                            ),
                            child: TextFormField(
                              initialValue: email,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email, color: Colors.blue,),
                                labelText: "Recipient Email",
                                labelStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              onChanged: (String val){
                                setState(() {
                                  email = val;
                                });
                              },
                              validator: (String? val){
                                if(val == null || val.isEmpty || !validator.email(val)){
                                  return "Enter recipient email";
                                }
                                return null;
                              },
                            ),
                          ),

                          Container(
                            width: responsiveViewWidth(),
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              border: Border.fromBorderSide(BorderSide(color: Colors.grey,width: 1.2)),
                            ),
                            child: TextFormField(
                              initialValue: name,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person, color: Colors.blue,),
                                labelText: "Recipient Name",
                                labelStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              onChanged: (String val){
                                setState(() {
                                  name = val;
                                });
                              },
                              validator: (String? val){
                                if(val == null || val.isEmpty || validator.name(val)){
                                  return "Enter recipient name";
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            width: responsiveViewWidth(),
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              border: Border.fromBorderSide(BorderSide(color: Colors.grey,width: 1.2)),
                            ),
                            child: TextFormField(
                              initialValue: address,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.location_city, color: Colors.blue,),
                                labelText: "Recipient Full Address",
                                labelStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              onChanged: (String val){
                                setState(() {
                                  address = val;
                                });
                              },
                              validator: (String? val){
                                if(val == null || val.isEmpty){
                                  return "Enter recipient address";
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            width: responsiveViewWidth(),
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              border: Border.fromBorderSide(BorderSide(color: Colors.grey,width: 1.2)),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              initialValue: postalCode,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.code, color: Colors.blue,),
                                labelText: "Recipient Postal Code",
                                labelStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              onChanged: (String val){
                                setState(() {
                                  postalCode = val;
                                });
                              },
                              validator: (String? val){
                                if(val == null || val.isEmpty || validator.postalCode(val)){
                                  return "Enter Postal Code";
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            width: responsiveViewWidth(),
                            margin: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              border: Border.fromBorderSide(BorderSide(color: Colors.grey,width: 1.2)),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              initialValue: phone,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.phone, color: Colors.blue,),
                                labelText: "Recipient Phone Number",
                                labelStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              onChanged: (String val){
                                setState(() {
                                  phone = val;
                                });
                              },
                              validator: (String? val){
                                if(val == null || val.isEmpty ||!validator.phone(val)){
                                  return "Enter recipient Phone";
                                }
                                return null;
                              },
                            ),
                          ),
                          const Text("Recipient Gender", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),),
                          Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: Gender.values.map((e){
                              return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    children: [
                                      Radio(
                                          value: e,
                                          groupValue: gender,
                                          onChanged: (e){
                                            setState(() {
                                              gender = e as Gender;
                                            });
                                          }
                                      ),
                                      Text(e.name),
                                    ],
                                  ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: responsiveViewWidth(),
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
                          }
                        },
                        child: const Text("SUBMIT", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
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

