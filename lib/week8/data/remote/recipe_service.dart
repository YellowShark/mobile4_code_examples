import 'dart:convert';

import 'package:widgets_app/week8/domain/model/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeService {
  Future<List<Recipe>> fetchRecipes() async {
    var url = Uri.parse('https://api.spoonacular.com/recipes/complexSearch?apiKey=d8984725e8224950a239ba8a2e1ecf47&query=borsch');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final results = jsonDecode(response.body)['results'] as List<dynamic>;
    return results.map((obj) => Recipe.fromJson(obj)).toList();
  }
}