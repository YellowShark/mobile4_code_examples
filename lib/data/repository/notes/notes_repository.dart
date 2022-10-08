import 'dart:async';

import 'package:flutter_notifications/data/entity/note_entity.dart';
import 'package:flutter_notifications/data/mapper/domain_to_dto.dart';
import 'package:flutter_notifications/data/mapper/dto_to_domain.dart';
import 'package:flutter_notifications/domain/model/note.dart';
import 'package:flutter_notifications/objectbox.g.dart';
import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';

@lazySingleton
class NotesRepository {
  late final Store _store;
  late final Box<NoteEntity> _box;
  final _controller = StreamController<List<NoteEntity>>.broadcast();

  Future initDB() async {
    _store = await openStore();
    _box = _store.box<NoteEntity>();
    _updateStream();
  }

  // READ
  List<Note> get notes => _box.getAll().map((e) => e.toDomain()).toList();

  Stream<List<Note>> get streamNotes => _controller.stream.map((event) => event.map((e) => e.toDomain()).toList());

  // CREATE
  Future addNote(Note note) async {
    await _box.putAsync(note.toEntity());
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
