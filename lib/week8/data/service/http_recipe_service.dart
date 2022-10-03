import 'package:injectable/injectable.dart';
import 'package:widgets_app/week8/data/mapper/dto_to_domain.dart';
import 'package:widgets_app/week8/data/service/response/recipe_response.dart';
import 'package:widgets_app/week8/domain/model/recipe.dart';
import 'package:http/http.dart' as http;
import 'package:widgets_app/week8/domain/service/recipe_service.dart';

@LazySingleton(as: RecipeService)
class HttpRecipeService implements RecipeService {
  @override
  Future<List<Recipe>> fetchRecipes() async {
    var url = Uri.parse('https://api.spoonacular.com/recipes/complexSearch?apiKey=d8984725e8224950a239ba8a2e1ecf47');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final results = RecipeResponse.fromJson(response.body);
    return results.result.map((e) => e.toDomain()).toList();
  }
}
