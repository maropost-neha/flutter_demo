import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:my_app_first/models/note.dart';

class DatabaseHelper{
  static DatabaseHelper databaseHelperInstance;
  DatabaseHelper.createInstance(); //named constructor initialized
  static Database noteDatabase;

  String noteTable= 'note_table';
  String noteId= 'id';
  String noteTitle= 'title';
  String noteDescription= 'description';
  String noteDate= 'date';

  factory DatabaseHelper(){
    if(databaseHelperInstance== null)
      databaseHelperInstance= DatabaseHelper.createInstance();
    return databaseHelperInstance;
  }

  Future<Database> get database async {
    if (noteDatabase == null) {
      noteDatabase = await initializeDatabase();
    }
    return noteDatabase;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    // Open/create the database at a given path
    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $noteTable($noteId INTEGER PRIMARY KEY AUTOINCREMENT, $noteTitle TEXT, '
        '$noteDescription TEXT, $noteDate TEXT)');
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await noteDatabase;
    var result = await db.query(noteTable);
    return result;
  }

  // Insert Operation: Insert a Note object to database
  Future<int> insertNote(Note note) async {
    Database db = await noteDatabase;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  // Update Operation: Update a Note object and save it to database
  Future<int> updateNote(Note note) async {
    var db = await noteDatabase;
    var result = await db.update(noteTable, note.toMap(), where: '$noteId = ?', whereArgs: [note.id]);
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deleteNote(int id) async {
    var db = await noteDatabase;
    int result = await db.rawDelete('DELETE FROM $noteTable WHERE $noteId = $id');
    return result;
  }

  // Get number of Note objects in database
  Future<int> getCount() async {
    Database db = await noteDatabase;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<Note>> getNoteList() async {

  var noteMapList = await getNoteMapList(); // Get 'Map List' from database
  int count = noteMapList.length;         // Count the number of map entries in db table

  List<Note> noteList = List<Note>();
  // For loop to create a 'Note List' from a 'Map List'
  for (int i = 0; i < count; i++) {
  noteList.add(Note.fromMapToNote(noteMapList[i]));
  }

  return noteList;
}


}