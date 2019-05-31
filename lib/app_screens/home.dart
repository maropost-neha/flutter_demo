import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0,top: 20.0),
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                      "New to Flutter",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 30.0,
                        fontFamily: 'Kodchasan',
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ), //textstyle
                    ) //Widget1 text
                ), //Expanded
                Expanded(
                    child: Text(
                      "First App",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 30.0,
                        fontFamily: 'Kodchasan',
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ), //textstyle
                    ) //Widget2 text
                ), //Expanded
              ], //Widgets
            ), //Row
            ShowImage(),
            ShowButton()
          ],
        )); //Container
  }
}

class ShowImage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage= AssetImage('images/flowers.jpeg');
    Image image= Image(image: assetImage, height: 200.0, width: 300.0,);
    return Container(child: image,);
  }
}

class ShowButton extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(child: RaisedButton(
      color: Colors.grey,
      child: Text("Raised Button",
      style: TextStyle(
        color:  Colors.white,
        fontSize: 14.0,
        fontFamily: 'Kodchasan',
      ),),//Text
      elevation: 3.0,
      onPressed: ()=> showMessage(context),
    )//Raised Button
    );//Container
  }

  void showMessage(BuildContext context){
    var alertDialog= AlertDialog(
      title: Text("Alert Dialog"),
      content: Text("This is an Alert Dialog!"),
    );
    showDialog(context: context,
    builder: (BuildContext context)=> alertDialog
    );
  }
}
