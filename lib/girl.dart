class Girl {
  final String name;
  final int age;

  Girl(this.name, this.age);

  @override
  String toString() {
    return 'Girl{name: $name, age: $age}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Girl && runtimeType == other.runtimeType && name == other.name && age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}