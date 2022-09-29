import 'package:flutter_notifications/data/entity/note_entity.dart';
import 'package:flutter_notifications/domain/model/note.dart';

extension NoteToNoteEntity on Note {
  NoteEntity toEntity() => NoteEntity(name: name, description: description);
}