import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets_app/week8/data/interactor/default_recipe_interactor.dart';
import 'package:widgets_app/week8/domain/interactor/recipe_interactor.dart';
import 'package:widgets_app/week8/domain/model/recipe.dart';

class HomeCubit extends Cubit<HomeState> {
  final RecipeInteractor _interactor;

  HomeCubit(this._interactor) : super(const InitialHomeState());

  Future<void> fetchData() async {
    emit(LoadedRecipesHomeState(await _interactor.getRecipes()));
  }
}

class HomeState {
  const HomeState();
}

class InitialHomeState extends HomeState {
  const InitialHomeState();
}

class LoadedRecipesHomeState extends HomeState {
  final List<Recipe> recipes;

  const LoadedRecipesHomeState(this.recipes);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LoadedRecipesHomeState && runtimeType == other.runtimeType && recipes == other.recipes;

  @override
  int get hashCode => recipes.hashCode;
}
