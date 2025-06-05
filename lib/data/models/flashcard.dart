import 'package:drift/drift.dart';
import 'package:flashcards/data/database.dart';
import 'package:flashcards/data/models/card_collection.dart';

enum FlashcardImageType {
  url,
  file,
}

class Flashcards extends Table with CommonColumns {
  TextColumn get collectionId => text().references(CardCollections, #id)();

  TextColumn get frontText => text().withLength(min: 1, max: 500)();
  TextColumn get backText => text().withLength(min: 1, max: 500)();

  TextColumn get frontImageUri => text().nullable()();
  IntColumn get frontImageType => intEnum<FlashcardImageType>().withDefault(const Constant(0))();
  TextColumn get backImageUri => text().nullable()();
  IntColumn get backImageType => intEnum<FlashcardImageType>().withDefault(const Constant(0))();
}
