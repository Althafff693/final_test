import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/note_model.dart';

class NoteListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil box dengan tipe <Note>
    final Box<Note> noteBox = Hive.box<Note>('notes');

    return Scaffold(
      appBar: AppBar(title: Text('Daftar Catatan')),
      body: ValueListenableBuilder(
        valueListenable: noteBox.listenable(),
        builder: (context, Box<Note> box, _) {
          // Jika box kosong
          if (box.isEmpty) {
            return Center(
              child: Text('Belum ada catatan.'),
            );
          }

          // Menampilkan daftar catatan
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final note = box.getAt(index);
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(note!.title),
                  subtitle: Text(note.description),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => box.deleteAt(index), // Menghapus catatan
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/add-note'),
      ),
    );
  }
}
