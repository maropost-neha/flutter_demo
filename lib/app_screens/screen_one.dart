import 'package:flutter/material.dart';
import 'package:my_app_first/app_screens/screen_two.dart';

class ScreenOne extends StatelessWidget { //a stateless widget is not dynamic.
  // It doesn’t depend on any data other than that is passed into it
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //used under MaterialApp,
        // it gives you basic functionalities like AppBar, BottomNavigationBar, Drawer, FloatingActionButton
        appBar: AppBar(
          //Widget holding screen name, navigation icon
          title:
              Text('Screen One'), // displays a string of text with single style
        ),
        body: Container(
          //contain child widget with the ability to apply some styling properties
          color: Colors.white,
          child: Column(
            //display widgets vertically
            children: <Widget>[
              Center(
                  //centers its child within itself
                  child: Padding( //insets its child by the given padding
                padding: EdgeInsets.only(top: 20.0), //edgeinsets is immutable set of offsets in each of the four cardinal directions
                child: Text(
                  "New to Flutter",
                  textDirection: TextDirection.ltr,
                  //ltr stands for left to right.
                  // English is Left to Right language and urdu is rtl(Right to Left)
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 30.0,
                    fontFamily: 'Kodchasan',
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ), //textstyle
                ), //TextWidget
              )), //Center Widget

              ShowImage(), //Show Image class

              RaisedButton(
                //based on a Material widget whose Material.elevation increases when the button is pressed
                color: Colors.grey,
                child: Text(
                  "Raised Button",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontFamily: 'Kodchasan',
                  ),
                ), //Text
                elevation: 3.0,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) { // manages a set of child widgets with a stack discipline
                    //MaterialPage route, a modal route that replaces the entire screen with a platform-adaptive transition
                    //For Android, the entrance transition for the page slides the page upwards and fades it in. The exit transition is the same, but in reverse.
                    return ScreenTwo();
                  }));
                },
              ), //Raised Button
            ],
          ),//Column
        ));
  }
}

class ShowImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/flowers.jpeg'); //Fetches an image from an AssetBundle, having determined the exact image to use based on the context
    Image image = Image( //displays image as jpeg, jpg, png, etc.
      image: assetImage,
      height: 200.0,
      width: 300.0,
    );
    return Container(
      padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
      child: image,
    );
  }
}
