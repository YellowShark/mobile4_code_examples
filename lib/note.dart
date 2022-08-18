import 'package:objectbox/objectbox.dart';

@Entity()
class Note {
  @Id()
  int id;
  String name;
  String description;

  Note({
    this.id = 0,
    required this.name,
    required this.description,
  });
}
