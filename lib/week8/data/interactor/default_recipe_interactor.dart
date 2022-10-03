import 'package:injectable/injectable.dart';
import 'package:widgets_app/week8/domain/interactor/recipe_interactor.dart';
import 'package:widgets_app/week8/domain/model/recipe.dart';
import 'package:widgets_app/week8/domain/service/recipe_service.dart';

// Client
@Injectable(as: RecipeInteractor)
class DefaultRecipeInteractor implements RecipeInteractor {
  final RecipeService _service; // Service

  DefaultRecipeInteractor(this._service);

  @override
  Future<List<Recipe>> getRecipes() => _service.fetchRecipes();
}
