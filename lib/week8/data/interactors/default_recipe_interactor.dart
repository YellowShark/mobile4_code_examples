import 'package:widgets_app/week8/data/remote/recipe_service.dart';
import 'package:widgets_app/week8/domain/interactors/recipe_interactor.dart';
import 'package:widgets_app/week8/domain/model/recipe.dart';

class DefaultRecipeInteractor implements RecipeInteractor {
  final RecipeService _service = RecipeService();

  @override
  Future<List<Recipe>> getRecipes() => _service.fetchRecipes();
}
