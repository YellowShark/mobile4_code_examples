import 'package:flutter_notifications/domain/interactor/notes/notes_interactor.dart';
import 'package:flutter_notifications/domain/model/note.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'notes_store.g.dart'; // Указание для кодогенерации

@injectable
class NotesStore = _NotesStore with _$NotesStore;

abstract class _NotesStore with Store {
  final NotesInteractor _notesInteractor;

  @observable
  List<Note> value = [];

  _NotesStore(this._notesInteractor);

  @action
  Future getData() async {
    await _notesInteractor.init();
    _notesInteractor.streamNotes.listen((notes) {
      value = notes;
    });
  }

  Future addNote(Note note) => _notesInteractor.addNote(note);
}
