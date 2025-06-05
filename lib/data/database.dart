import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flashcards/data/models/card_collection.dart';
import 'package:flashcards/data/models/flashcard.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

part 'database.g.dart';

mixin CommonColumns on Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt => dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DriftDatabase(tables: [
  CardCollections,
  Flashcards,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
