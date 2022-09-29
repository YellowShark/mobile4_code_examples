import 'package:widgets_app/week8/domain/model/recipe.dart';

abstract class RecipeService {
  Future<List<Recipe>> fetchRecipes();
}