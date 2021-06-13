import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/models/Note.dart';
import 'package:flutter_notes_app/models/NotesOperations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'add_screen.dart';
import 'edit_screen.dart';

class HomeScreen extends StatelessWidget {
  Note note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddScreen()));
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.lightBlue,
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('NotesHelper'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<NotesOperation>(
        builder: (context, NotesOperation data, child) {
          return ListView.separated(
            separatorBuilder: (context, index){
              return Container(height: 15,);
            },
            itemCount: data.getNotes.length,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(13),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Slidable(

                  actionPane: SlidableDrawerActionPane(),
                  actions: [
                    IconSlideAction(
                      color: Colors.green,
                      caption: 'Edit',
                      icon: Icons.edit,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> EditScreen()));
                      },
                    )
                  ],
                  secondaryActions: [
                    IconSlideAction(
                      color: Colors.red,
                      caption: 'delete',
                      icon: Icons.delete,
                      onTap: (){
                        final note =  Provider.of<NotesOperation>(context, listen: false).note;
                        Provider.of<NotesOperation>(context, listen: false).removeNotes(note);

                      },
                    )
                  ],
                  child: NotesCard(
                    data.getNotes[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class NotesCard extends StatelessWidget {
 final Note note;

  NotesCard(this.note);
  @override
  Widget build(BuildContext context) {
    return Container(
color: Colors.white,
      //margin: EdgeInsets.only(top: 15,bottom: 15),
      padding: EdgeInsets.all(15),
      height: 150,
      width: MediaQuery.of(context).size.width,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(note.title,
            style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 5,),
          Text(note.description,
              style: TextStyle(
              fontSize: 17,
          ),
          ),
        ],
      ),
    );
  }
}
