import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:mcc_app/models/database.dart";

class HomeList extends StatefulWidget{
  const HomeList({Key? key}) : super(key: key);

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  var data = [];
  bool _loading = true;

  fetchData() async {
    var products =await SQLiteDbProvider.db.getAllProducts();
    return products.toList();
  }

  @override
  void initState(){
    super.initState();
    fetchData().then((res){
      data = res;
      setState(() {
        _loading = false;
      });
    }).catchError((err)=>print(err));
  }

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        backgroundColor: Colors.blue,
        body: _loading ?
            const Center (
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
                color: Colors.red,
              ),
            ):
            Column(
              children: <Widget>[
                Flexible(
                    flex:1,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.pink,
                      ),
                      padding: const EdgeInsets.only(top:50),
                      child:  const Text(
                        "Jokes",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color:Colors.green
                        ),
                      ),
                  )
                ),
                Flexible(
                  flex: 4,
                    child: ListView.builder(
                        itemCount: data.length,
                        addRepaintBoundaries: true,
                        itemBuilder:(context, idx) => JokeTile(
                          data[idx].id,
                          data[idx].first_name,
                          data[idx].joke
                        )
                  )
                )
              ],
            )
      )
    );
  }
}

class JokeTile extends StatelessWidget{
  final int id;
  final String first_name;
  final String joke;
  const JokeTile(this.id, this.first_name, this.joke, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
      child: ListTile(
        selectedTileColor: Colors.lightGreenAccent,
        leading: Text(
          id.toString(),
          style: const TextStyle(color: Colors.amber, fontSize: 30,fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        title: Text(
          first_name,
          style: const TextStyle(color:Colors.green,fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          joke,
          style: const TextStyle(color: Colors.deepPurple, fontSize: 17),
        ),
        tileColor: Colors.white,
      ),
    );
  }
}