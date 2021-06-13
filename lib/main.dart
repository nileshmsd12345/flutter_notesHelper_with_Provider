import 'package:flutter/material.dart';
import 'package:flutter_notes_app/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'models/NotesOperations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotesOperation>(
      create: (context)=> NotesOperation(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          home: HomeScreen()
      ),
    );
  }
}
