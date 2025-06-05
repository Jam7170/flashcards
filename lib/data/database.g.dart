// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CardCollectionsTable extends CardCollections
    with TableInfo<$CardCollectionsTable, CardCollection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardCollectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, updatedAt, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'card_collections';
  @override
  VerificationContext validateIntegrity(Insertable<CardCollection> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CardCollection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardCollection(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $CardCollectionsTable createAlias(String alias) {
    return $CardCollectionsTable(attachedDatabase, alias);
  }
}

class CardCollection extends DataClass implements Insertable<CardCollection> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String? description;
  const CardCollection(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.name,
      this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  CardCollectionsCompanion toCompanion(bool nullToAbsent) {
    return CardCollectionsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory CardCollection.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardCollection(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
    };
  }

  CardCollection copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? name,
          Value<String?> description = const Value.absent()}) =>
      CardCollection(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
      );
  CardCollection copyWithCompanion(CardCollectionsCompanion data) {
    return CardCollection(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CardCollection(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, updatedAt, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardCollection &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.name == this.name &&
          other.description == this.description);
}

class CardCollectionsCompanion extends UpdateCompanion<CardCollection> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> rowid;
  const CardCollectionsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CardCollectionsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CardCollection> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CardCollectionsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? name,
      Value<String?>? description,
      Value<int>? rowid}) {
    return CardCollectionsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardCollectionsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FlashcardsTable extends Flashcards
    with TableInfo<$FlashcardsTable, Flashcard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FlashcardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => const Uuid().v4());
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _collectionIdMeta =
      const VerificationMeta('collectionId');
  @override
  late final GeneratedColumn<String> collectionId = GeneratedColumn<String>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES card_collections (id)'));
  static const VerificationMeta _frontTextMeta =
      const VerificationMeta('frontText');
  @override
  late final GeneratedColumn<String> frontText = GeneratedColumn<String>(
      'front_text', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _backTextMeta =
      const VerificationMeta('backText');
  @override
  late final GeneratedColumn<String> backText = GeneratedColumn<String>(
      'back_text', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _frontImageUriMeta =
      const VerificationMeta('frontImageUri');
  @override
  late final GeneratedColumn<String> frontImageUri = GeneratedColumn<String>(
      'front_image_uri', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _frontImageTypeMeta =
      const VerificationMeta('frontImageType');
  @override
  late final GeneratedColumnWithTypeConverter<FlashcardImageType, int>
      frontImageType = GeneratedColumn<int>(
              'front_image_type', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: const Constant(0))
          .withConverter<FlashcardImageType>(
              $FlashcardsTable.$converterfrontImageType);
  static const VerificationMeta _backImageUriMeta =
      const VerificationMeta('backImageUri');
  @override
  late final GeneratedColumn<String> backImageUri = GeneratedColumn<String>(
      'back_image_uri', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _backImageTypeMeta =
      const VerificationMeta('backImageType');
  @override
  late final GeneratedColumnWithTypeConverter<FlashcardImageType, int>
      backImageType = GeneratedColumn<int>(
              'back_image_type', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: const Constant(0))
          .withConverter<FlashcardImageType>(
              $FlashcardsTable.$converterbackImageType);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        collectionId,
        frontText,
        backText,
        frontImageUri,
        frontImageType,
        backImageUri,
        backImageType
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'flashcards';
  @override
  VerificationContext validateIntegrity(Insertable<Flashcard> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('collection_id')) {
      context.handle(
          _collectionIdMeta,
          collectionId.isAcceptableOrUnknown(
              data['collection_id']!, _collectionIdMeta));
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    if (data.containsKey('front_text')) {
      context.handle(_frontTextMeta,
          frontText.isAcceptableOrUnknown(data['front_text']!, _frontTextMeta));
    } else if (isInserting) {
      context.missing(_frontTextMeta);
    }
    if (data.containsKey('back_text')) {
      context.handle(_backTextMeta,
          backText.isAcceptableOrUnknown(data['back_text']!, _backTextMeta));
    } else if (isInserting) {
      context.missing(_backTextMeta);
    }
    if (data.containsKey('front_image_uri')) {
      context.handle(
          _frontImageUriMeta,
          frontImageUri.isAcceptableOrUnknown(
              data['front_image_uri']!, _frontImageUriMeta));
    }
    context.handle(_frontImageTypeMeta, const VerificationResult.success());
    if (data.containsKey('back_image_uri')) {
      context.handle(
          _backImageUriMeta,
          backImageUri.isAcceptableOrUnknown(
              data['back_image_uri']!, _backImageUriMeta));
    }
    context.handle(_backImageTypeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Flashcard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Flashcard(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}collection_id'])!,
      frontText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}front_text'])!,
      backText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}back_text'])!,
      frontImageUri: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}front_image_uri']),
      frontImageType: $FlashcardsTable.$converterfrontImageType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}front_image_type'])!),
      backImageUri: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}back_image_uri']),
      backImageType: $FlashcardsTable.$converterbackImageType.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.int, data['${effectivePrefix}back_image_type'])!),
    );
  }

  @override
  $FlashcardsTable createAlias(String alias) {
    return $FlashcardsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<FlashcardImageType, int, int>
      $converterfrontImageType =
      const EnumIndexConverter<FlashcardImageType>(FlashcardImageType.values);
  static JsonTypeConverter2<FlashcardImageType, int, int>
      $converterbackImageType =
      const EnumIndexConverter<FlashcardImageType>(FlashcardImageType.values);
}

class Flashcard extends DataClass implements Insertable<Flashcard> {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String collectionId;
  final String frontText;
  final String backText;
  final String? frontImageUri;
  final FlashcardImageType frontImageType;
  final String? backImageUri;
  final FlashcardImageType backImageType;
  const Flashcard(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.collectionId,
      required this.frontText,
      required this.backText,
      this.frontImageUri,
      required this.frontImageType,
      this.backImageUri,
      required this.backImageType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['collection_id'] = Variable<String>(collectionId);
    map['front_text'] = Variable<String>(frontText);
    map['back_text'] = Variable<String>(backText);
    if (!nullToAbsent || frontImageUri != null) {
      map['front_image_uri'] = Variable<String>(frontImageUri);
    }
    {
      map['front_image_type'] = Variable<int>(
          $FlashcardsTable.$converterfrontImageType.toSql(frontImageType));
    }
    if (!nullToAbsent || backImageUri != null) {
      map['back_image_uri'] = Variable<String>(backImageUri);
    }
    {
      map['back_image_type'] = Variable<int>(
          $FlashcardsTable.$converterbackImageType.toSql(backImageType));
    }
    return map;
  }

  FlashcardsCompanion toCompanion(bool nullToAbsent) {
    return FlashcardsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      collectionId: Value(collectionId),
      frontText: Value(frontText),
      backText: Value(backText),
      frontImageUri: frontImageUri == null && nullToAbsent
          ? const Value.absent()
          : Value(frontImageUri),
      frontImageType: Value(frontImageType),
      backImageUri: backImageUri == null && nullToAbsent
          ? const Value.absent()
          : Value(backImageUri),
      backImageType: Value(backImageType),
    );
  }

  factory Flashcard.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Flashcard(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      collectionId: serializer.fromJson<String>(json['collectionId']),
      frontText: serializer.fromJson<String>(json['frontText']),
      backText: serializer.fromJson<String>(json['backText']),
      frontImageUri: serializer.fromJson<String?>(json['frontImageUri']),
      frontImageType: $FlashcardsTable.$converterfrontImageType
          .fromJson(serializer.fromJson<int>(json['frontImageType'])),
      backImageUri: serializer.fromJson<String?>(json['backImageUri']),
      backImageType: $FlashcardsTable.$converterbackImageType
          .fromJson(serializer.fromJson<int>(json['backImageType'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'collectionId': serializer.toJson<String>(collectionId),
      'frontText': serializer.toJson<String>(frontText),
      'backText': serializer.toJson<String>(backText),
      'frontImageUri': serializer.toJson<String?>(frontImageUri),
      'frontImageType': serializer.toJson<int>(
          $FlashcardsTable.$converterfrontImageType.toJson(frontImageType)),
      'backImageUri': serializer.toJson<String?>(backImageUri),
      'backImageType': serializer.toJson<int>(
          $FlashcardsTable.$converterbackImageType.toJson(backImageType)),
    };
  }

  Flashcard copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? collectionId,
          String? frontText,
          String? backText,
          Value<String?> frontImageUri = const Value.absent(),
          FlashcardImageType? frontImageType,
          Value<String?> backImageUri = const Value.absent(),
          FlashcardImageType? backImageType}) =>
      Flashcard(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        collectionId: collectionId ?? this.collectionId,
        frontText: frontText ?? this.frontText,
        backText: backText ?? this.backText,
        frontImageUri:
            frontImageUri.present ? frontImageUri.value : this.frontImageUri,
        frontImageType: frontImageType ?? this.frontImageType,
        backImageUri:
            backImageUri.present ? backImageUri.value : this.backImageUri,
        backImageType: backImageType ?? this.backImageType,
      );
  Flashcard copyWithCompanion(FlashcardsCompanion data) {
    return Flashcard(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
      frontText: data.frontText.present ? data.frontText.value : this.frontText,
      backText: data.backText.present ? data.backText.value : this.backText,
      frontImageUri: data.frontImageUri.present
          ? data.frontImageUri.value
          : this.frontImageUri,
      frontImageType: data.frontImageType.present
          ? data.frontImageType.value
          : this.frontImageType,
      backImageUri: data.backImageUri.present
          ? data.backImageUri.value
          : this.backImageUri,
      backImageType: data.backImageType.present
          ? data.backImageType.value
          : this.backImageType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Flashcard(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('collectionId: $collectionId, ')
          ..write('frontText: $frontText, ')
          ..write('backText: $backText, ')
          ..write('frontImageUri: $frontImageUri, ')
          ..write('frontImageType: $frontImageType, ')
          ..write('backImageUri: $backImageUri, ')
          ..write('backImageType: $backImageType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      collectionId,
      frontText,
      backText,
      frontImageUri,
      frontImageType,
      backImageUri,
      backImageType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Flashcard &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.collectionId == this.collectionId &&
          other.frontText == this.frontText &&
          other.backText == this.backText &&
          other.frontImageUri == this.frontImageUri &&
          other.frontImageType == this.frontImageType &&
          other.backImageUri == this.backImageUri &&
          other.backImageType == this.backImageType);
}

class FlashcardsCompanion extends UpdateCompanion<Flashcard> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> collectionId;
  final Value<String> frontText;
  final Value<String> backText;
  final Value<String?> frontImageUri;
  final Value<FlashcardImageType> frontImageType;
  final Value<String?> backImageUri;
  final Value<FlashcardImageType> backImageType;
  final Value<int> rowid;
  const FlashcardsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.collectionId = const Value.absent(),
    this.frontText = const Value.absent(),
    this.backText = const Value.absent(),
    this.frontImageUri = const Value.absent(),
    this.frontImageType = const Value.absent(),
    this.backImageUri = const Value.absent(),
    this.backImageType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FlashcardsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String collectionId,
    required String frontText,
    required String backText,
    this.frontImageUri = const Value.absent(),
    this.frontImageType = const Value.absent(),
    this.backImageUri = const Value.absent(),
    this.backImageType = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : collectionId = Value(collectionId),
        frontText = Value(frontText),
        backText = Value(backText);
  static Insertable<Flashcard> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? collectionId,
    Expression<String>? frontText,
    Expression<String>? backText,
    Expression<String>? frontImageUri,
    Expression<int>? frontImageType,
    Expression<String>? backImageUri,
    Expression<int>? backImageType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (collectionId != null) 'collection_id': collectionId,
      if (frontText != null) 'front_text': frontText,
      if (backText != null) 'back_text': backText,
      if (frontImageUri != null) 'front_image_uri': frontImageUri,
      if (frontImageType != null) 'front_image_type': frontImageType,
      if (backImageUri != null) 'back_image_uri': backImageUri,
      if (backImageType != null) 'back_image_type': backImageType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FlashcardsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? collectionId,
      Value<String>? frontText,
      Value<String>? backText,
      Value<String?>? frontImageUri,
      Value<FlashcardImageType>? frontImageType,
      Value<String?>? backImageUri,
      Value<FlashcardImageType>? backImageType,
      Value<int>? rowid}) {
    return FlashcardsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      collectionId: collectionId ?? this.collectionId,
      frontText: frontText ?? this.frontText,
      backText: backText ?? this.backText,
      frontImageUri: frontImageUri ?? this.frontImageUri,
      frontImageType: frontImageType ?? this.frontImageType,
      backImageUri: backImageUri ?? this.backImageUri,
      backImageType: backImageType ?? this.backImageType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (collectionId.present) {
      map['collection_id'] = Variable<String>(collectionId.value);
    }
    if (frontText.present) {
      map['front_text'] = Variable<String>(frontText.value);
    }
    if (backText.present) {
      map['back_text'] = Variable<String>(backText.value);
    }
    if (frontImageUri.present) {
      map['front_image_uri'] = Variable<String>(frontImageUri.value);
    }
    if (frontImageType.present) {
      map['front_image_type'] = Variable<int>($FlashcardsTable
          .$converterfrontImageType
          .toSql(frontImageType.value));
    }
    if (backImageUri.present) {
      map['back_image_uri'] = Variable<String>(backImageUri.value);
    }
    if (backImageType.present) {
      map['back_image_type'] = Variable<int>(
          $FlashcardsTable.$converterbackImageType.toSql(backImageType.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlashcardsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('collectionId: $collectionId, ')
          ..write('frontText: $frontText, ')
          ..write('backText: $backText, ')
          ..write('frontImageUri: $frontImageUri, ')
          ..write('frontImageType: $frontImageType, ')
          ..write('backImageUri: $backImageUri, ')
          ..write('backImageType: $backImageType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CardCollectionsTable cardCollections =
      $CardCollectionsTable(this);
  late final $FlashcardsTable flashcards = $FlashcardsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [cardCollections, flashcards];
}

typedef $$CardCollectionsTableCreateCompanionBuilder = CardCollectionsCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  required String name,
  Value<String?> description,
  Value<int> rowid,
});
typedef $$CardCollectionsTableUpdateCompanionBuilder = CardCollectionsCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> name,
  Value<String?> description,
  Value<int> rowid,
});

final class $$CardCollectionsTableReferences extends BaseReferences<
    _$AppDatabase, $CardCollectionsTable, CardCollection> {
  $$CardCollectionsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$FlashcardsTable, List<Flashcard>>
      _flashcardsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.flashcards,
              aliasName: $_aliasNameGenerator(
                  db.cardCollections.id, db.flashcards.collectionId));

  $$FlashcardsTableProcessedTableManager get flashcardsRefs {
    final manager = $$FlashcardsTableTableManager($_db, $_db.flashcards)
        .filter((f) => f.collectionId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_flashcardsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CardCollectionsTableFilterComposer
    extends Composer<_$AppDatabase, $CardCollectionsTable> {
  $$CardCollectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  Expression<bool> flashcardsRefs(
      Expression<bool> Function($$FlashcardsTableFilterComposer f) f) {
    final $$FlashcardsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.flashcards,
        getReferencedColumn: (t) => t.collectionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FlashcardsTableFilterComposer(
              $db: $db,
              $table: $db.flashcards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CardCollectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $CardCollectionsTable> {
  $$CardCollectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));
}

class $$CardCollectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardCollectionsTable> {
  $$CardCollectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  Expression<T> flashcardsRefs<T extends Object>(
      Expression<T> Function($$FlashcardsTableAnnotationComposer a) f) {
    final $$FlashcardsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.flashcards,
        getReferencedColumn: (t) => t.collectionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FlashcardsTableAnnotationComposer(
              $db: $db,
              $table: $db.flashcards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CardCollectionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CardCollectionsTable,
    CardCollection,
    $$CardCollectionsTableFilterComposer,
    $$CardCollectionsTableOrderingComposer,
    $$CardCollectionsTableAnnotationComposer,
    $$CardCollectionsTableCreateCompanionBuilder,
    $$CardCollectionsTableUpdateCompanionBuilder,
    (CardCollection, $$CardCollectionsTableReferences),
    CardCollection,
    PrefetchHooks Function({bool flashcardsRefs})> {
  $$CardCollectionsTableTableManager(
      _$AppDatabase db, $CardCollectionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardCollectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardCollectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardCollectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CardCollectionsCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            name: name,
            description: description,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CardCollectionsCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            name: name,
            description: description,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CardCollectionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({flashcardsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (flashcardsRefs) db.flashcards],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (flashcardsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CardCollectionsTableReferences
                            ._flashcardsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CardCollectionsTableReferences(db, table, p0)
                                .flashcardsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.collectionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CardCollectionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CardCollectionsTable,
    CardCollection,
    $$CardCollectionsTableFilterComposer,
    $$CardCollectionsTableOrderingComposer,
    $$CardCollectionsTableAnnotationComposer,
    $$CardCollectionsTableCreateCompanionBuilder,
    $$CardCollectionsTableUpdateCompanionBuilder,
    (CardCollection, $$CardCollectionsTableReferences),
    CardCollection,
    PrefetchHooks Function({bool flashcardsRefs})>;
typedef $$FlashcardsTableCreateCompanionBuilder = FlashcardsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  required String collectionId,
  required String frontText,
  required String backText,
  Value<String?> frontImageUri,
  Value<FlashcardImageType> frontImageType,
  Value<String?> backImageUri,
  Value<FlashcardImageType> backImageType,
  Value<int> rowid,
});
typedef $$FlashcardsTableUpdateCompanionBuilder = FlashcardsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> collectionId,
  Value<String> frontText,
  Value<String> backText,
  Value<String?> frontImageUri,
  Value<FlashcardImageType> frontImageType,
  Value<String?> backImageUri,
  Value<FlashcardImageType> backImageType,
  Value<int> rowid,
});

final class $$FlashcardsTableReferences
    extends BaseReferences<_$AppDatabase, $FlashcardsTable, Flashcard> {
  $$FlashcardsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CardCollectionsTable _collectionIdTable(_$AppDatabase db) =>
      db.cardCollections.createAlias($_aliasNameGenerator(
          db.flashcards.collectionId, db.cardCollections.id));

  $$CardCollectionsTableProcessedTableManager? get collectionId {
    if ($_item.collectionId == null) return null;
    final manager =
        $$CardCollectionsTableTableManager($_db, $_db.cardCollections)
            .filter((f) => f.id($_item.collectionId!));
    final item = $_typedResult.readTableOrNull(_collectionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$FlashcardsTableFilterComposer
    extends Composer<_$AppDatabase, $FlashcardsTable> {
  $$FlashcardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get frontText => $composableBuilder(
      column: $table.frontText, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get backText => $composableBuilder(
      column: $table.backText, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get frontImageUri => $composableBuilder(
      column: $table.frontImageUri, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<FlashcardImageType, FlashcardImageType, int>
      get frontImageType => $composableBuilder(
          column: $table.frontImageType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get backImageUri => $composableBuilder(
      column: $table.backImageUri, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<FlashcardImageType, FlashcardImageType, int>
      get backImageType => $composableBuilder(
          column: $table.backImageType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  $$CardCollectionsTableFilterComposer get collectionId {
    final $$CardCollectionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.cardCollections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardCollectionsTableFilterComposer(
              $db: $db,
              $table: $db.cardCollections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FlashcardsTableOrderingComposer
    extends Composer<_$AppDatabase, $FlashcardsTable> {
  $$FlashcardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get frontText => $composableBuilder(
      column: $table.frontText, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get backText => $composableBuilder(
      column: $table.backText, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get frontImageUri => $composableBuilder(
      column: $table.frontImageUri,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get frontImageType => $composableBuilder(
      column: $table.frontImageType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get backImageUri => $composableBuilder(
      column: $table.backImageUri,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get backImageType => $composableBuilder(
      column: $table.backImageType,
      builder: (column) => ColumnOrderings(column));

  $$CardCollectionsTableOrderingComposer get collectionId {
    final $$CardCollectionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.cardCollections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardCollectionsTableOrderingComposer(
              $db: $db,
              $table: $db.cardCollections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FlashcardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FlashcardsTable> {
  $$FlashcardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get frontText =>
      $composableBuilder(column: $table.frontText, builder: (column) => column);

  GeneratedColumn<String> get backText =>
      $composableBuilder(column: $table.backText, builder: (column) => column);

  GeneratedColumn<String> get frontImageUri => $composableBuilder(
      column: $table.frontImageUri, builder: (column) => column);

  GeneratedColumnWithTypeConverter<FlashcardImageType, int>
      get frontImageType => $composableBuilder(
          column: $table.frontImageType, builder: (column) => column);

  GeneratedColumn<String> get backImageUri => $composableBuilder(
      column: $table.backImageUri, builder: (column) => column);

  GeneratedColumnWithTypeConverter<FlashcardImageType, int> get backImageType =>
      $composableBuilder(
          column: $table.backImageType, builder: (column) => column);

  $$CardCollectionsTableAnnotationComposer get collectionId {
    final $$CardCollectionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.cardCollections,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardCollectionsTableAnnotationComposer(
              $db: $db,
              $table: $db.cardCollections,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FlashcardsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FlashcardsTable,
    Flashcard,
    $$FlashcardsTableFilterComposer,
    $$FlashcardsTableOrderingComposer,
    $$FlashcardsTableAnnotationComposer,
    $$FlashcardsTableCreateCompanionBuilder,
    $$FlashcardsTableUpdateCompanionBuilder,
    (Flashcard, $$FlashcardsTableReferences),
    Flashcard,
    PrefetchHooks Function({bool collectionId})> {
  $$FlashcardsTableTableManager(_$AppDatabase db, $FlashcardsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FlashcardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FlashcardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FlashcardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String> collectionId = const Value.absent(),
            Value<String> frontText = const Value.absent(),
            Value<String> backText = const Value.absent(),
            Value<String?> frontImageUri = const Value.absent(),
            Value<FlashcardImageType> frontImageType = const Value.absent(),
            Value<String?> backImageUri = const Value.absent(),
            Value<FlashcardImageType> backImageType = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FlashcardsCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            collectionId: collectionId,
            frontText: frontText,
            backText: backText,
            frontImageUri: frontImageUri,
            frontImageType: frontImageType,
            backImageUri: backImageUri,
            backImageType: backImageType,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            required String collectionId,
            required String frontText,
            required String backText,
            Value<String?> frontImageUri = const Value.absent(),
            Value<FlashcardImageType> frontImageType = const Value.absent(),
            Value<String?> backImageUri = const Value.absent(),
            Value<FlashcardImageType> backImageType = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FlashcardsCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            collectionId: collectionId,
            frontText: frontText,
            backText: backText,
            frontImageUri: frontImageUri,
            frontImageType: frontImageType,
            backImageUri: backImageUri,
            backImageType: backImageType,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$FlashcardsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({collectionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (collectionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.collectionId,
                    referencedTable:
                        $$FlashcardsTableReferences._collectionIdTable(db),
                    referencedColumn:
                        $$FlashcardsTableReferences._collectionIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$FlashcardsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FlashcardsTable,
    Flashcard,
    $$FlashcardsTableFilterComposer,
    $$FlashcardsTableOrderingComposer,
    $$FlashcardsTableAnnotationComposer,
    $$FlashcardsTableCreateCompanionBuilder,
    $$FlashcardsTableUpdateCompanionBuilder,
    (Flashcard, $$FlashcardsTableReferences),
    Flashcard,
    PrefetchHooks Function({bool collectionId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CardCollectionsTableTableManager get cardCollections =>
      $$CardCollectionsTableTableManager(_db, _db.cardCollections);
  $$FlashcardsTableTableManager get flashcards =>
      $$FlashcardsTableTableManager(_db, _db.flashcards);
}
