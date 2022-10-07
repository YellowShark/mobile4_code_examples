import 'dart:async';

import 'package:flutter_notifications/note.dart';
import 'package:flutter_notifications/objectbox.g.dart';
import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';

import 'config.dart';

@LazySingleton(env: [MyEnvironment.release])
class NotesRepository {
  late final Store _store;
  late final Box<Note> _box;
  final _controller = StreamController<List<Note>>.broadcast();

  Future initDB() async {
    _store = await openStore();
    _box = _store.box<Note>();
    _updateStream();
  }

  // READ
  List<Note> get notes => _box.getAll();

  Stream<List<Note>> get streamNotes => _controller.stream;

  // CREATE
  Future addNote(Note note) async {
    await _box.putAsync(note);
    _updateStream();
  }

  Future deleteNote(Note note) async {
    // TODO
  }

  Future updateNote(Note note) async {
    // TODO
  }

  Future _updateStream() async {
    await Future.delayed(const Duration(seconds: 1));
    _controller.add(_box.getAll());
  }
}

@LazySingleton(env: [MyEnvironment.mock])
class FakeNotesRepository {

}

class SingletonExample {
  static SingletonExample? instance;

  static SingletonExample getInstance() {
    if (instance == null) {
      instance = SingletonExample();
    }
    return instance!;
  }
}

class FactoryExample {
  static FactoryExample create() {
    return FactoryExample();
  }
}
