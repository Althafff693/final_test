import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/note_model.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/note_list_page.dart';
import 'pages/calendar_page.dart';
import 'pages/add_note_page.dart';
import 'pages/about_page.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('notes');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/notes': (context) => NoteListPage(),
        '/calendar': (context) => CalendarPage(),
        '/add-note': (context) => AddNotePage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
