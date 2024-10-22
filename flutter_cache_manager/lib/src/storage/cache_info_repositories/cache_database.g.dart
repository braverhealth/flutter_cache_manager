// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_database.dart';

// ignore_for_file: type=lint
class $CachedObjectTable extends CachedObject
    with TableInfo<$CachedObjectTable, CachedObjectData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedObjectTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
      'path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _etagMeta = const VerificationMeta('etag');
  @override
  late final GeneratedColumn<String> etag = GeneratedColumn<String>(
      'etag', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _validTillMeta =
      const VerificationMeta('validTill');
  @override
  late final GeneratedColumn<int> validTill = GeneratedColumn<int>(
      'valid_till', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _touchedMeta =
      const VerificationMeta('touched');
  @override
  late final GeneratedColumn<int> touched = GeneratedColumn<int>(
      'touched', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lengthMeta = const VerificationMeta('length');
  @override
  late final GeneratedColumn<int> length = GeneratedColumn<int>(
      'length', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, url, key, path, etag, validTill, touched, length];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_object';
  @override
  VerificationContext validateIntegrity(Insertable<CachedObjectData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('etag')) {
      context.handle(
          _etagMeta, etag.isAcceptableOrUnknown(data['etag']!, _etagMeta));
    }
    if (data.containsKey('valid_till')) {
      context.handle(_validTillMeta,
          validTill.isAcceptableOrUnknown(data['valid_till']!, _validTillMeta));
    } else if (isInserting) {
      context.missing(_validTillMeta);
    }
    if (data.containsKey('touched')) {
      context.handle(_touchedMeta,
          touched.isAcceptableOrUnknown(data['touched']!, _touchedMeta));
    } else if (isInserting) {
      context.missing(_touchedMeta);
    }
    if (data.containsKey('length')) {
      context.handle(_lengthMeta,
          length.isAcceptableOrUnknown(data['length']!, _lengthMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedObjectData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedObjectData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path'])!,
      etag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}etag']),
      validTill: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}valid_till'])!,
      touched: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}touched'])!,
      length: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}length']),
    );
  }

  @override
  $CachedObjectTable createAlias(String alias) {
    return $CachedObjectTable(attachedDatabase, alias);
  }
}

class CachedObjectData extends DataClass
    implements Insertable<CachedObjectData> {
  final int id;
  final String url;
  final String key;
  final String path;
  final String? etag;
  final int validTill;
  final int touched;
  final int? length;
  const CachedObjectData(
      {required this.id,
      required this.url,
      required this.key,
      required this.path,
      this.etag,
      required this.validTill,
      required this.touched,
      this.length});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['url'] = Variable<String>(url);
    map['key'] = Variable<String>(key);
    map['path'] = Variable<String>(path);
    if (!nullToAbsent || etag != null) {
      map['etag'] = Variable<String>(etag);
    }
    map['valid_till'] = Variable<int>(validTill);
    map['touched'] = Variable<int>(touched);
    if (!nullToAbsent || length != null) {
      map['length'] = Variable<int>(length);
    }
    return map;
  }

  CachedObjectCompanion toCompanion(bool nullToAbsent) {
    return CachedObjectCompanion(
      id: Value(id),
      url: Value(url),
      key: Value(key),
      path: Value(path),
      etag: etag == null && nullToAbsent ? const Value.absent() : Value(etag),
      validTill: Value(validTill),
      touched: Value(touched),
      length:
          length == null && nullToAbsent ? const Value.absent() : Value(length),
    );
  }

  factory CachedObjectData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedObjectData(
      id: serializer.fromJson<int>(json['id']),
      url: serializer.fromJson<String>(json['url']),
      key: serializer.fromJson<String>(json['key']),
      path: serializer.fromJson<String>(json['path']),
      etag: serializer.fromJson<String?>(json['etag']),
      validTill: serializer.fromJson<int>(json['validTill']),
      touched: serializer.fromJson<int>(json['touched']),
      length: serializer.fromJson<int?>(json['length']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'url': serializer.toJson<String>(url),
      'key': serializer.toJson<String>(key),
      'path': serializer.toJson<String>(path),
      'etag': serializer.toJson<String?>(etag),
      'validTill': serializer.toJson<int>(validTill),
      'touched': serializer.toJson<int>(touched),
      'length': serializer.toJson<int?>(length),
    };
  }

  CachedObjectData copyWith(
          {int? id,
          String? url,
          String? key,
          String? path,
          Value<String?> etag = const Value.absent(),
          int? validTill,
          int? touched,
          Value<int?> length = const Value.absent()}) =>
      CachedObjectData(
        id: id ?? this.id,
        url: url ?? this.url,
        key: key ?? this.key,
        path: path ?? this.path,
        etag: etag.present ? etag.value : this.etag,
        validTill: validTill ?? this.validTill,
        touched: touched ?? this.touched,
        length: length.present ? length.value : this.length,
      );
  CachedObjectData copyWithCompanion(CachedObjectCompanion data) {
    return CachedObjectData(
      id: data.id.present ? data.id.value : this.id,
      url: data.url.present ? data.url.value : this.url,
      key: data.key.present ? data.key.value : this.key,
      path: data.path.present ? data.path.value : this.path,
      etag: data.etag.present ? data.etag.value : this.etag,
      validTill: data.validTill.present ? data.validTill.value : this.validTill,
      touched: data.touched.present ? data.touched.value : this.touched,
      length: data.length.present ? data.length.value : this.length,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedObjectData(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('key: $key, ')
          ..write('path: $path, ')
          ..write('etag: $etag, ')
          ..write('validTill: $validTill, ')
          ..write('touched: $touched, ')
          ..write('length: $length')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, url, key, path, etag, validTill, touched, length);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedObjectData &&
          other.id == this.id &&
          other.url == this.url &&
          other.key == this.key &&
          other.path == this.path &&
          other.etag == this.etag &&
          other.validTill == this.validTill &&
          other.touched == this.touched &&
          other.length == this.length);
}

class CachedObjectCompanion extends UpdateCompanion<CachedObjectData> {
  final Value<int> id;
  final Value<String> url;
  final Value<String> key;
  final Value<String> path;
  final Value<String?> etag;
  final Value<int> validTill;
  final Value<int> touched;
  final Value<int?> length;
  const CachedObjectCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.key = const Value.absent(),
    this.path = const Value.absent(),
    this.etag = const Value.absent(),
    this.validTill = const Value.absent(),
    this.touched = const Value.absent(),
    this.length = const Value.absent(),
  });
  CachedObjectCompanion.insert({
    this.id = const Value.absent(),
    required String url,
    required String key,
    required String path,
    this.etag = const Value.absent(),
    required int validTill,
    required int touched,
    this.length = const Value.absent(),
  })  : url = Value(url),
        key = Value(key),
        path = Value(path),
        validTill = Value(validTill),
        touched = Value(touched);
  static Insertable<CachedObjectData> custom({
    Expression<int>? id,
    Expression<String>? url,
    Expression<String>? key,
    Expression<String>? path,
    Expression<String>? etag,
    Expression<int>? validTill,
    Expression<int>? touched,
    Expression<int>? length,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (key != null) 'key': key,
      if (path != null) 'path': path,
      if (etag != null) 'etag': etag,
      if (validTill != null) 'valid_till': validTill,
      if (touched != null) 'touched': touched,
      if (length != null) 'length': length,
    });
  }

  CachedObjectCompanion copyWith(
      {Value<int>? id,
      Value<String>? url,
      Value<String>? key,
      Value<String>? path,
      Value<String?>? etag,
      Value<int>? validTill,
      Value<int>? touched,
      Value<int?>? length}) {
    return CachedObjectCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      key: key ?? this.key,
      path: path ?? this.path,
      etag: etag ?? this.etag,
      validTill: validTill ?? this.validTill,
      touched: touched ?? this.touched,
      length: length ?? this.length,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (etag.present) {
      map['etag'] = Variable<String>(etag.value);
    }
    if (validTill.present) {
      map['valid_till'] = Variable<int>(validTill.value);
    }
    if (touched.present) {
      map['touched'] = Variable<int>(touched.value);
    }
    if (length.present) {
      map['length'] = Variable<int>(length.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedObjectCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('key: $key, ')
          ..write('path: $path, ')
          ..write('etag: $etag, ')
          ..write('validTill: $validTill, ')
          ..write('touched: $touched, ')
          ..write('length: $length')
          ..write(')'))
        .toString();
  }
}

abstract class _$CacheDatabase extends GeneratedDatabase {
  _$CacheDatabase(QueryExecutor e) : super(e);
  $CacheDatabaseManager get managers => $CacheDatabaseManager(this);
  late final $CachedObjectTable cachedObject = $CachedObjectTable(this);
  late final Index tableCacheObjectKey = Index('_tableCacheObjectKey',
      'CREATE INDEX _tableCacheObjectKey ON cached_object ("key")');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [cachedObject, tableCacheObjectKey];
}

typedef $$CachedObjectTableCreateCompanionBuilder = CachedObjectCompanion
    Function({
  Value<int> id,
  required String url,
  required String key,
  required String path,
  Value<String?> etag,
  required int validTill,
  required int touched,
  Value<int?> length,
});
typedef $$CachedObjectTableUpdateCompanionBuilder = CachedObjectCompanion
    Function({
  Value<int> id,
  Value<String> url,
  Value<String> key,
  Value<String> path,
  Value<String?> etag,
  Value<int> validTill,
  Value<int> touched,
  Value<int?> length,
});

class $$CachedObjectTableFilterComposer
    extends Composer<_$CacheDatabase, $CachedObjectTable> {
  $$CachedObjectTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get path => $composableBuilder(
      column: $table.path, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get etag => $composableBuilder(
      column: $table.etag, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get validTill => $composableBuilder(
      column: $table.validTill, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get touched => $composableBuilder(
      column: $table.touched, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get length => $composableBuilder(
      column: $table.length, builder: (column) => ColumnFilters(column));
}

class $$CachedObjectTableOrderingComposer
    extends Composer<_$CacheDatabase, $CachedObjectTable> {
  $$CachedObjectTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get path => $composableBuilder(
      column: $table.path, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get etag => $composableBuilder(
      column: $table.etag, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get validTill => $composableBuilder(
      column: $table.validTill, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get touched => $composableBuilder(
      column: $table.touched, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get length => $composableBuilder(
      column: $table.length, builder: (column) => ColumnOrderings(column));
}

class $$CachedObjectTableAnnotationComposer
    extends Composer<_$CacheDatabase, $CachedObjectTable> {
  $$CachedObjectTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);

  GeneratedColumn<int> get validTill =>
      $composableBuilder(column: $table.validTill, builder: (column) => column);

  GeneratedColumn<int> get touched =>
      $composableBuilder(column: $table.touched, builder: (column) => column);

  GeneratedColumn<int> get length =>
      $composableBuilder(column: $table.length, builder: (column) => column);
}

class $$CachedObjectTableTableManager extends RootTableManager<
    _$CacheDatabase,
    $CachedObjectTable,
    CachedObjectData,
    $$CachedObjectTableFilterComposer,
    $$CachedObjectTableOrderingComposer,
    $$CachedObjectTableAnnotationComposer,
    $$CachedObjectTableCreateCompanionBuilder,
    $$CachedObjectTableUpdateCompanionBuilder,
    (
      CachedObjectData,
      BaseReferences<_$CacheDatabase, $CachedObjectTable, CachedObjectData>
    ),
    CachedObjectData,
    PrefetchHooks Function()> {
  $$CachedObjectTableTableManager(_$CacheDatabase db, $CachedObjectTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedObjectTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedObjectTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedObjectTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<String> key = const Value.absent(),
            Value<String> path = const Value.absent(),
            Value<String?> etag = const Value.absent(),
            Value<int> validTill = const Value.absent(),
            Value<int> touched = const Value.absent(),
            Value<int?> length = const Value.absent(),
          }) =>
              CachedObjectCompanion(
            id: id,
            url: url,
            key: key,
            path: path,
            etag: etag,
            validTill: validTill,
            touched: touched,
            length: length,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String url,
            required String key,
            required String path,
            Value<String?> etag = const Value.absent(),
            required int validTill,
            required int touched,
            Value<int?> length = const Value.absent(),
          }) =>
              CachedObjectCompanion.insert(
            id: id,
            url: url,
            key: key,
            path: path,
            etag: etag,
            validTill: validTill,
            touched: touched,
            length: length,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedObjectTableProcessedTableManager = ProcessedTableManager<
    _$CacheDatabase,
    $CachedObjectTable,
    CachedObjectData,
    $$CachedObjectTableFilterComposer,
    $$CachedObjectTableOrderingComposer,
    $$CachedObjectTableAnnotationComposer,
    $$CachedObjectTableCreateCompanionBuilder,
    $$CachedObjectTableUpdateCompanionBuilder,
    (
      CachedObjectData,
      BaseReferences<_$CacheDatabase, $CachedObjectTable, CachedObjectData>
    ),
    CachedObjectData,
    PrefetchHooks Function()>;

class $CacheDatabaseManager {
  final _$CacheDatabase _db;
  $CacheDatabaseManager(this._db);
  $$CachedObjectTableTableManager get cachedObject =>
      $$CachedObjectTableTableManager(_db, _db.cachedObject);
}
