import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_notifications/data/entity/note_entity.dart';
import 'package:flutter_notifications/data/repository/notes/notes_repository.dart';
import 'package:flutter_notifications/domain/model/note.dart';
import 'package:flutter_notifications/ui/notes/notes_store.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _viewModel = NotesStore();

  @override
  void initState() {
    super.initState();
   _viewModel.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: _viewModel.value.length,
          itemBuilder: (_, i) => ListTile(
            title: Text(
              _viewModel.value[i].name,
            ),
            subtitle: Text(
              _viewModel.value[i].description,
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future _showDialog() => showGeneralDialog(
        context: context,
        barrierDismissible: false,
        pageBuilder: (_, __, ___) {
          final nameController = TextEditingController();
          final descController = TextEditingController();
          return AlertDialog(
            title: const Text('New note'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(hintText: 'Description'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  await _viewModel.addNote(
                    Note.create(
                      name: nameController.text,
                      description: descController.text,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              )
            ],
          );
        },
      );
}
