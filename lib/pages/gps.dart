import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GetLocation extends StatefulWidget{
  const GetLocation({Key? key}) : super(key: key);

  @override
  _GetLocationState createState() => _GetLocationState();

}

class _GetLocationState extends State<GetLocation>{
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return (
    const Scaffold(
      body: Text(
        "Hello world"
      ),
    )
    );
  }
}