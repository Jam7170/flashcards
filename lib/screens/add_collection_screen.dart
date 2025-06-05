import 'package:drift/drift.dart' hide Column;
import 'package:flashcards/data/database.dart';
import 'package:flutter/material.dart';
import 'package:flashcards/global.dart';
import 'package:uuid/uuid.dart';

class AddCollectionScreen extends StatefulWidget {
  const AddCollectionScreen({super.key});

  @override
  State<AddCollectionScreen> createState() => _AddCollectionScreenState();
}

class _AddCollectionScreenState extends State<AddCollectionScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Collection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Collection Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a collection name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _save,
                child: const Text('Save Collection'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _save() async {
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text;
      final description = _descriptionController.text;

      final collectionId = const Uuid().v4();

      await appDatabase.into(appDatabase.cardCollections).insert(CardCollectionsCompanion.insert(
            id: Value(collectionId),
            name: name,
            description: Value(description),
          ));

      // Add single test flashcard to the new collection
      await appDatabase.into(appDatabase.flashcards).insert(FlashcardsCompanion.insert(
            frontText: 'Sample Question',
            backText: 'Sample Answer',
            collectionId: collectionId,
          ));

      if (mounted) Navigator.pop(context);
    }
  }
}
