import 'dart:convert';

class RecipeResponse {
  final List<RecipeDto> result;

  RecipeResponse(this.result);

  factory RecipeResponse.fromJson(String json) {
    final results = jsonDecode(json)['results'] as List<dynamic>;
    return RecipeResponse(results.map((obj) => RecipeDto.fromJson(obj)).toList());
  }
}

class RecipeDto {
  final String title;
  final String image;
  final int time;

  RecipeDto({
    required this.title,
    required this.image,
    required this.time,
  });

  factory RecipeDto.fromJson(Map<String, dynamic> json) => RecipeDto(
    title: json['title'],
    image: json['image'],
    time: 0,
  );
}