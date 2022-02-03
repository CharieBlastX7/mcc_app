import "package:flutter/material.dart";
import "package:mcc_app/pages/home.dart";

void main() => runApp(app);

var app = MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "App",
  initialRoute: "/home",
  routes: {
    "/home":(context)=>const Home(),
  },
);