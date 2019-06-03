import 'package:flutter/material.dart';

class ScreenTwo extends StatefulWidget {
  //Stateful widgets are dynamic.
  // They allow us to create widgets which can dynamically change their content over time and
  // don’t rely on static states which are passed in during their instantiation
  @override
  State<StatefulWidget> createState() {
    return ScreenTwoState();
  }
}

class ScreenTwoState extends State<ScreenTwo> {
  var userInput = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Screen Two'),
      ),
      body: Container(
          margin: EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              Text(
                'Please enter text below',
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Kodchasan',
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ), //Widget Text
              TextField(
                //lets the user enter text, either with hardware keyboard or with an onscreen keyboard
                onSubmitted: (String input) {
                  setState(() {
                    userInput = input;
                  });
                  showMessage(context);
                },
              ), //Widget Textfield
            ],
          )),
    ));
  }

  void showMessage(BuildContext context) {
    var alertDialog = AlertDialog(
      //Informs the user about situations that require acknowledgement.
      // An alert dialog has an optional title and an optional list of actions
      title: Text("Alert Dialog"),
      content: Text("User input is $userInput"),
    );
    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }
}
