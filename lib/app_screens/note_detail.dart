import 'package:flutter/material.dart';
import 'package:my_app_first/models/note.dart';
import 'package:my_app_first/utils/database_helper.dart';

class NoteDetail extends StatefulWidget {
  String appBarTitle;
  final Note note;
  NoteDetail(this. note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteDetailState(this.note, this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  static var _priorities = ['High', 'Low'];

  DatabaseHelper helper = DatabaseHelper();
  String appBarTitle='';
  Note note;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  NoteDetailState(this.note, String appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .title;
    titleController.text = note.title;
    descriptionController.text = note.description;

    return WillPopScope(onWillPop: () {
      moveToLastScreen();
    },
        child:
        Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
            leading: IconButton(icon: Icon(Icons.arrow_back),
              onPressed: () {
                moveToLastScreen();
              },),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                // First element
                /*ListTile(
              title: DropdownButton(
                  items: _priorities.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  style: textStyle,
                  value: 'Low',
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      debugPrint('User selected $valueSelectedByUser');
                    });
                  }),
            ),*/

                // Widget
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: titleController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                    },
                    decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),

                // Widget
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: descriptionController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Description Text Field');
                    },
                    decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),

                // Widget
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Theme
                              .of(context)
                              .primaryColorDark,
                          textColor: Theme
                              .of(context)
                              .primaryColorLight,
                          child: Text(
                            'Save',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Save button clicked");
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 5.0,
                      ),
                      Expanded(
                        child: RaisedButton(
                          color: Theme
                              .of(context)
                              .primaryColorDark,
                          textColor: Theme
                              .of(context)
                              .primaryColorLight,
                          child: Text(
                            'Delete',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Delete button clicked");
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )); //Scaffold
  }

  void moveToLastScreen(){
    Navigator.pop(context);
  }

  // Update the title of Note object
  void updateTitle(){
    note.title=titleController.text;
  }

  // Update the description of Note object
  void updateDescription() {
    note.description = descriptionController.text;
  }

  // Save data to database
  void _save() async {

    moveToLastScreen();

    var now = new DateTime.now();
    note.date = now as String;
    int result;
    if (note.id != null) {  // Case 1: Update operation
      result = await helper.updateNote(note);
    } else { // Case 2: Insert Operation
      result = await helper.insertNote(note);
    }

    if (result != 0) {  // Success
      _showAlertDialog('Status', 'Note Saved Successfully');
    } else {  // Failure
      _showAlertDialog('Status', 'Problem Saving Note');
    }

  }

  void _delete() async {

    moveToLastScreen();

    // Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
    // the detail page by pressing the FAB of NoteList page.
    if (note.id == null) {
      _showAlertDialog('Status', 'No Note was deleted');
      return;
    }

    // Case 2: User is trying to delete the old note that already has a valid ID.
    int result = await helper.deleteNote(note.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Note Deleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Note');
    }
  }

  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }

}
