class Note {
  final int id;
  final String name;
  final String description;

  Note({
    required this.id,
    required this.name,
    required this.description,
  });

  Note.create({
    this.id = 0,
    required this.name,
    required this.description,
  });
}
