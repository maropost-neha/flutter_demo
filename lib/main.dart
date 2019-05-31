import 'package:flutter/material.dart';
import './app_screens/home.dart';
import './app_screens/notelist.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'NoteKeeper',
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(primarySwatch: Colors.black12),
      home: NoteList(),

    );
  }

}

/*void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Exploring UI Widgets",
    home: Scaffold(
      appBar: AppBar(title: Text("Flutter Demo")),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> debugPrint('Floating action button'),
        child: Icon(Icons.add),
        tooltip: 'Floating Action Button',
      ), // Floating action button
    ), // Scaffold
  ));
}

Widget getListView() {
  var listview = ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.account_circle),
        title: Text("Username"),
        subtitle: Text("Email"),
        trailing: Icon(Icons.wb_sunny),
        onTap: () => debugPrint('List Item Clicked'),
      ), //ListTile1
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text("Mountain"),
        subtitle: Text("Hill"),
        trailing: Icon(Icons.filter_hdr),
        onTap: () => debugPrint('List item Clicked'),
      ), //ListTile2
    ],
  );
  return listview;
}

void showSnackBar(BuildContext context, String text){
  var snackbar= SnackBar(
    content: Text("$text"),
  ); // snackbar
  Scaffold.of(context).showSnackBar(snackbar);
}*/
