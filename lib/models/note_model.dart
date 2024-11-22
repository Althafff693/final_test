import 'package:hive/hive.dart';

part 'note_model.g.dart'; // Wajib ada untuk code generation

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final DateTime date;

  Note({
    required this.title,
    required this.description,
    required this.date,
  });
}
