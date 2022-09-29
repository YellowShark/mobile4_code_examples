import 'package:widgets_app/week8/data/service/http_recipe_service.dart';
import 'package:widgets_app/week8/domain/interactor/recipe_interactor.dart';
import 'package:widgets_app/week8/domain/model/recipe.dart';
import 'package:widgets_app/week8/domain/service/recipe_service.dart';

class DefaultRecipeInteractor implements RecipeInteractor {
  final RecipeService _service = HttpRecipeService();

  @override
  Future<List<Recipe>> getRecipes() => _service.fetchRecipes();
}
