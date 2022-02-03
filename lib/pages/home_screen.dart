import "package:flutter/material.dart";
import "package:mcc_app/models/database.dart";
import "dart:developer";

class HomeList extends StatefulWidget{
  const HomeList({Key? key}) : super(key: key);

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {

  fetchData() {
    var products = SQLiteDbProvider.db.getAllProducts();
    log(products.toString());
    // return products;
  }

  @override
  void initState(){
    super.initState();
    // var products = fetchData();
    // log(products);
  }

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          width: 1000,
          height: 1900,
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 80),
          child: Container(

          ),
        )
      )
    );
  }
}