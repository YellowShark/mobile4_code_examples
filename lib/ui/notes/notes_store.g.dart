// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotesStore on _NotesStore, Store {
  late final _$valueAtom = Atom(name: '_NotesStore.value', context: context);

  @override
  List<Note> get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(List<Note> value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_NotesStore.getData', context: context);

  @override
  Future<dynamic> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}