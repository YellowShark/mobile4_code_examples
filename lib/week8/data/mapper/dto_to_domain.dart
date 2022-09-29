import 'package:widgets_app/week8/data/service/response/recipe_response.dart';
import 'package:widgets_app/week8/domain/model/recipe.dart';

extension RecipeDtoToDomain on RecipeDto {
  Recipe toDomain() => Recipe(title: title, image: image, time: time.toString());
}