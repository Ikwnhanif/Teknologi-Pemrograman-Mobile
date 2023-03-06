import 'package:flutter/material.dart';
import 'package:tugas1/screens/login_view.dart';
import 'package:tugas1/screens/register_view.dart';
import 'package:tugas1/screens/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Login Register Page",
    initialRoute: "/",
    routes: {
      "/": (context) => LoginPage(),
      RegisterPage.routeName: (context) => RegisterPage(),
      HomePage.routeName: (context) => HomePage(),
    },
  ));
}
