import 'package:animated_value/animated_value.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flashcards/data/database.dart';
import 'package:flashcards/global.dart';
import 'package:flashcards/screens/add_collection_screen.dart';
import 'package:flashcards/widgets/flashcard_pack.dart';
import 'package:flutter/material.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  int _hoveredIndex = -1;

  late Stream<List<CardCollection>> _collectionsStream;

  @override
  void initState() {
    super.initState();
    _collectionsStream = appDatabase.cardCollections.select().watch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddCollectionScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<CardCollection>>(
        stream: _collectionsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No collections found.'));
          }

          final collections = snapshot.data!;

          return ListView.builder(
            itemCount: collections.length,
            itemBuilder: (context, index) {
              final collection = collections[index];
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => setState(() => _hoveredIndex = index),
                onExit: (_) => setState(() => _hoveredIndex = -1),
                child: AnimatedValue<double>(
                  value: _hoveredIndex == index ? 20 : 0,
                  duration: const Duration(milliseconds: 100),
                  builder: (context, value, _) {
                    return FlashcardPack(
                      title: collection.name,
                      cardText: '',
                      boxColor: Theme.of(context).colorScheme.surfaceContainer,
                      cardColors: [Colors.grey[200]!],
                      frontCardHeight: value,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
