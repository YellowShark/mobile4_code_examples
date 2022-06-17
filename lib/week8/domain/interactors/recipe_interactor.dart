import 'package:widgets_app/week8/domain/model/recipe.dart';

abstract class RecipeInteractor {
  Future<List<Recipe>> getRecipes();
}