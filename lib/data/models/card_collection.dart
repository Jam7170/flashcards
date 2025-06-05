import 'package:drift/drift.dart';
import 'package:flashcards/data/database.dart';

class CardCollections extends Table with CommonColumns {
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().nullable()();
}
