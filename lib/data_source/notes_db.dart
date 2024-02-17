import 'dart:async';
import 'package:floor/floor.dart';
import 'package:note_app/dao/note_dao.dart';
import 'package:note_app/model/note.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'notes_db.g.dart';


@Database(version: 1, entities: [Note])
abstract class AppDatabase extends FloorDatabase {
  NoteDao get noteDao;
}