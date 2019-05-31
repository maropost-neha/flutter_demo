import 'package:flutter/material.dart';

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FavoriteCityState();
  }
}

class FavoriteCityState extends State<FavoriteCity> {
  String userInput = "";
  var dropDownItems = ['item1', 'item2', 'item3','item4'];
  var currentSelection = 'item1';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Stateful App")),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField(
                onSubmitted: (String input) {
                  setState(() {
                    userInput = input;
                  });
                },
              ),
              Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Text(
                    "The input is $userInput",
                    style: TextStyle(
                        fontFamily: 'Kodchasan',
                        fontSize: 18.0,
                        color: Colors.black),
                  )),
              DropdownButton<String>(
                items: dropDownItems.map((String dropDownStringItems) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItems,
                    child: Text(dropDownStringItems),
                  );
                }).toList(),
                onChanged: (String selected) {
                  setState(() {
                    this.currentSelection= selected;
                  });
                },
                value: currentSelection,
              ),
            ],
          ),
        ));
  }
}