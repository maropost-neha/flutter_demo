class Note {
  int _id;
  String _title;
  String _description;
  String _date;

  Note(this._title, this._description, this._date);

  Note.withId(
      this._id, this._title, this._description, this._date); //named constructor

  int get id => _id;

  String get title => _title;

  String get description => _description;

  String get date => _date;

  set title(String newTitle) {
    if (newTitle.length < 50) {
      this._title = newTitle;
    }
  }

  set description(String newDesc) {
    if (newDesc.length < 60) {
      this._title = newDesc;
    }
  }

  set date(String newDate) {
    this._title = newDate;
  }

  //Convert Note object to mao object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['date'] = _date;

    return map;
  }

  //Convert Map object to Note object
  Note.fromMapToNote(Map<String, dynamic> map) {
    this._id= map['id'];
    this._title= map['title'];
    this._description= map['description'];
    this._date= map['date'];
  }
}
