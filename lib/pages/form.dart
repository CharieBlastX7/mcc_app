import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:mcc_app/models/database.dart";
import 'package:mcc_app/models/product.dart';

class FormWid extends StatefulWidget {
  const FormWid({Key? key}) : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<FormWid> {
  final name = TextEditingController();
  final joke = TextEditingController();
  @override
  void initState(){
    super.initState();
  }

  insertData() async {
    Product prod = Product(1, name.text, joke.text);
    var res = await SQLiteDbProvider.db.insert(prod);
    return res;
  }

  void onPressed(){
    SystemChannels.textInput.invokeMethod("TextInput.hide");
    insertData();
    name.clear();
    joke.clear();
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
                  const Text("JOKE",textScaleFactor: 4,),
                  const Spacer(
                    flex: 1,
                  ),
                  Column(children:[const Text("Name",textScaleFactor: 2,),formField1(name)]),
                  const SizedBox(height: 15,),
                  Column(children: [const Text("Joke",textScaleFactor: 2,),formField1(joke)]),
                  const SizedBox(height: 5,),
                  ElevatedButton(
                    onPressed:()=>{onPressed()},
                    child:const Text("Submit"),
                  )
                ],
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 80),
          ),
        ),
    );
  }
}