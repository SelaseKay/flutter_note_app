import 'package:note_app/data_source/notes_db.dart';
import 'package:note_app/model/note.dart';

class NoteRepository {
  final AppDatabase database;

  NoteRepository(this.database);

  Future<void> addNote(Note note) async{
    return database.noteDao.insertNote(note);
  }

  Future<void> updateNote(Note note) async {
    return database.noteDao.updateNote(note);
  }

  Future<void> deleteNote(Note note) async {
    return database.noteDao.deleteNote(note);
  }

  Future<List<Note>> getNotes() async {
    return database.noteDao.getNotes();
  }
}
