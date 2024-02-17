import 'package:flutter/material.dart';
import 'package:note_app/data_source/notes_db.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/repository/note_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'note_viewmodel.g.dart';

@riverpod
class NoteViewModel extends _$NoteViewModel {
  NoteRepository? _noteRepository;

  @override
  Future<List<Note>> build() async {
    if (_noteRepository == null) await _initNoteRepo();

    state = await AsyncValue.guard<List<Note>>(() {
      return _noteRepository?.getNotes() ?? Future<List<Note>>.value([]);
    });

    return state.value?.reversed.toList() ?? [];

  }

  Future<void> _initNoteRepo() async {
    try {
      final appDatabase =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      _noteRepository = NoteRepository(appDatabase);
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
  }

  Future<void> addNote(Note note) async {
    state = const AsyncValue.loading();
    if (_noteRepository == null) await _initNoteRepo();
    await AsyncValue.guard<void>(() => _noteRepository!.addNote(note));
    ref.invalidateSelf();
    await future;
  }

  Future<void> updateNote(Note note) async {
    state = const AsyncValue.loading();
    if (_noteRepository == null) await _initNoteRepo();
    await AsyncValue.guard<void>(() => _noteRepository!.updateNote(note));
    ref.invalidateSelf();
    await future;
  }

   Future<void> deleteNote(Note note) async {
    state = const AsyncValue.loading();
    if (_noteRepository == null) await _initNoteRepo();
    await AsyncValue.guard<void>(() => _noteRepository!.deleteNote(note));
    ref.invalidateSelf();
    await future;
  }
}
