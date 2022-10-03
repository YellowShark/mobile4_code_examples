// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/interactor/default_recipe_interactor.dart' as _i6;
import '../data/service/http_recipe_service.dart' as _i4;
import '../domain/interactor/recipe_interactor.dart' as _i5;
import '../domain/service/recipe_service.dart' as _i3;
import '../ui/home/home_store.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.RecipeService>(() => _i4.HttpRecipeService());
  gh.factory<_i5.RecipeInteractor>(
      () => _i6.DefaultRecipeInteractor(get<_i3.RecipeService>()));
  gh.factory<_i7.HomeStore>(() => _i7.HomeStore(get<_i5.RecipeInteractor>()));
  return get;
}
