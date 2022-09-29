import 'package:flutter_notifications/data/entity/note_entity.dart';
import 'package:flutter_notifications/domain/model/note.dart';

extension NoteEntityToNote on NoteEntity {
  Note toDomain() => Note(id: id, name: name, description: description);
}