import 'package:flutter/material.dart';
import 'package:flutter_notes_app/models/NotesOperations.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddScreen extends StatelessWidget {
  String titleText;
  String descriptionText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('NotesHelper'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Title',
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              onChanged: (value){
                titleText= value;
              },
            ),
            Expanded(
              child: TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Description',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                onChanged: (value){
                  descriptionText= value;
                },
              ),
            ),
            FlatButton(
              color: Colors.white,
                onPressed: (){
                Provider.of<NotesOperation>(context, listen: false).addNewNotes(titleText, descriptionText);
                Navigator.pop(context);
                },
                child: Text('Add Notes',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
