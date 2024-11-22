import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/note_model.dart';

class AddNotePage extends StatefulWidget {
  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void saveNote() {
    final title = titleController.text;
    final description = descriptionController.text;
    final note = Note(
      title: title,
      description: description,
      date: DateTime.now(),
    );
    final box = Hive.box<Note>('notes');
    box.add(note);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Catatan Baru')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Judul'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Deskripsi'),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: saveNote, child: Text('Simpan Catatan')),
          ],
        ),
      ),
    );
  }
}
