import 'package:flutter/material.dart';
import './app_screens/screen_one.dart';

void main() {
  runApp(MaterialApp(
      //starting point of your app,
      // it tells Flutter that you are going to use Material components and follow material design in your app.
      //An application that uses material design
      //A convenience widget that wraps a number of widgets that are commonly required for material design applications
      debugShowCheckedModeBanner: false,
      title: "Screen transition with widgets",
      home: ScreenOne()));
}
