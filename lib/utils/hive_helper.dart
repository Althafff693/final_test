import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(UserAdapter());
}

