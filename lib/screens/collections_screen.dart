import 'package:animated_value/animated_value.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flashcards/data/database.dart';
import 'package:flashcards/global.dart';
import 'package:flashcards/screens/add_collection_screen.dart';
import 'package:flashcards/widgets/flashcard_pack.dart';
import 'package:flutter/material.dart';

typedef CardCollectionAndCard = ({CardCollection collection, Flashcard? flashcard});

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  int _hoveredIndex = -1;

  late Stream<List<CardCollectionAndCard>> _collectionsStream;

  void _getStream() {
    _collectionsStream = appDatabase.cardCollections.select().watch().asyncMap((collections) async {
      final List<CardCollectionAndCard> collectionsWithCards = [];
      for (final collection in collections) {
        final flashcard = (await (appDatabase.flashcards.select()
                  ..where(
                    (tbl) => tbl.collectionId.equals(collection.id),
                  ))
                .get())
            .firstOrNull;
        collectionsWithCards.add((collection: collection, flashcard: flashcard));
      }
      return collectionsWithCards;
    });
  }

  @override
  void initState() {
    super.initState();
    _getStream();
  }

  @override
  void dispose() {
    _collectionsStream.drain();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddCollectionScreen(),
            ),
          );
          _getStream();
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<CardCollectionAndCard>>(
        stream: _collectionsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No collections found.'));
          }

          final collectionsAndCards = snapshot.data!;

          return ListView.builder(
            itemCount: collectionsAndCards.length,
            itemBuilder: (context, index) {
              final data = collectionsAndCards[index];
              final (:collection, :flashcard) = data;
              print('Collection: ${collection.name}, Flashcard: ${flashcard?.frontText ?? "No flashcard"}');
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
                      cardText: flashcard?.frontText,
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
