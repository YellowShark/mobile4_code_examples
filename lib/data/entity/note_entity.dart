import 'package:objectbox/objectbox.dart';

@Entity()
class NoteEntity {
  @Id()
  int id;
  String name;
  String description;

  NoteEntity({
    this.id = 0,
    required this.name,
    required this.description,
  });
}
