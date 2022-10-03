// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$valueAtom = Atom(name: '_HomeStore.value', context: context);

  @override
  List<Recipe> get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(List<Recipe> value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('_HomeStore.fetchData', context: context);

  @override
  Future<dynamic> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
