import 'dart:developer';
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:http/http.dart" as http;

class FormWid extends StatefulWidget {
  const FormWid({Key? key}) : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<FormWid> {
  final field1Text = TextEditingController();
  final field2Text = TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  // Future<void> sendData(name,age) async {
  //   const url = "API_URL";
  //   var uri = Uri.parse(url);
  //   var res = await http.post(uri,body:{
  //     name,age
  //   });
  //   log(res.toString());
  // }

  void onPressed(){
    SystemChannels.textInput.invokeMethod("TextInput.hide");
    log(field2Text.text.toString() + " " +field1Text.text.toString());
  }

  @override
  Widget build(BuildContext context){

    formField1(controller) {
     return TextField(
      controller: controller,
      autofocus: false,
      cursorColor:Colors.white,
      style: const TextStyle(
        color:Colors.blue,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
          fillColor: Colors.grey[900],
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintStyle: TextStyle(
              color: Colors.grey[400]
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: const BorderSide(
                  color: Colors.blueAccent,
                  width: 4
              )
          )
      ),
    );}

    return Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(
          child:Padding(
            child:Center(
              child:Column(
                children: [
                  Column(children:[const Text("Name",textScaleFactor: 2,),formField1(field1Text)]),
                  const SizedBox(height: 10,),
                  Column(children: [const Text("Age",textScaleFactor: 2,),formField1(field2Text)]),
                  ElevatedButton(
                    onPressed:()=>{onPressed()},
                    child:const Text("Submit"),
                  )
                ],
              ),
            ),
            padding: const EdgeInsets.all(10),
          ),
        ),
    );
  }
}