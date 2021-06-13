import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Note.dart';

class NotesOperation extends ChangeNotifier{
  Note note;
  List<Note> _notes = new List<Note>();

  List<Note> get getNotes {
    return _notes;
  }


  NotesOperation(){
    addNewNotes('First Note', 'First Note Description');
  }

  void addNewNotes(String title, String description ){
    note =Note(title,description);
    _notes.add(note);
    notifyListeners();
  }
  void removeNotes(Note note){
    _notes.remove(note);
    notifyListeners();
  }
  void updateNotes(Note note,String title, String description){
    note.title= title;
    note.description= description;
    notifyListeners();
  }
}