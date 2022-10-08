import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'config.config.dart';

// Переменная для быстрого доступа к GetIt
final getIt = GetIt.instance;

// Специальная аннотация для функции configureDependencies(),
// которая проинициализирует наш DI
@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => $initGetIt(getIt);