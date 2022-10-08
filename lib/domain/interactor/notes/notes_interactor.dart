import 'package:flutter_notifications/data/repository/notes/notes_repository.dart';
import 'package:flutter_notifications/domain/model/note.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotesInteractor {
  final NotesRepository _repository;

  NotesInteractor(this._repository);

  Stream<List<Note>> get streamNotes => _repository.streamNotes;

  List<Note> get notes => _repository.notes;

  Future init() => _repository.initDB();

  // CREATE
  Future addNote(Note note) => _repository.addNote(note);

  Future deleteNote(Note note) => _repository.deleteNote(note);

  Future updateNote(Note note) => _repository.updateNote(note);
}