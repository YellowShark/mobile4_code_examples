import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:widgets_app/week8/data/interactor/default_recipe_interactor.dart';
import 'package:widgets_app/week8/domain/interactor/recipe_interactor.dart';
import 'package:widgets_app/week8/domain/model/recipe.dart';

part 'home_store.g.dart';

@Injectable()
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final RecipeInteractor interactor;

  _HomeStore(this.interactor);

  @observable
  List<Recipe> value = [];

  @action
  Future fetchData() async {
    final result = await interactor.getRecipes();
    value = result;
  }
}