import 'package:flutter_notifications/domain/interactor/notes/notes_interactor.dart';
import 'package:flutter_notifications/domain/model/note.dart';
import 'package:mobx/mobx.dart';

part 'notes_store.g.dart'; // Указание для кодогенерации

class NotesStore = _NotesStore with _$NotesStore;

abstract class _NotesStore with Store {
  final _notesInteractor = NotesInteractor();

  @observable
  List<Note> value = [];

  @action
  Future getData() async {
    await _notesInteractor.init();
    _notesInteractor.streamNotes.listen((notes) {
      value = notes;
    });
  }

  Future addNote(Note note) => _notesInteractor.addNote(note);
}
