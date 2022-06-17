class Recipe {
  final String title;
  final String image;

  Recipe({
    required this.title,
    required this.image,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        title: json['title'],
        image: json['image'],
      );
}
