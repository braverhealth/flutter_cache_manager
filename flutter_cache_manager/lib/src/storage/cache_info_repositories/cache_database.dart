import 'package:clock/clock.dart';
import 'package:drift/drift.dart';

import '../cache_object.dart';

part 'cache_database.g.dart';

@TableIndex(name: '_tableCacheObjectKey', columns: {#key})
class CachedObject extends Table {
  IntColumn get id => integer()();
  TextColumn get url => text()();
  TextColumn get key => text()();
  TextColumn get path => text()();
  TextColumn get etag => text().nullable()();
  IntColumn get validTill => integer()();
  IntColumn get touched => integer()();
  IntColumn get length => integer().nullable()();

  @override
  Set<Column>? get primaryKey => {id};
}

@DriftDatabase(tables: [CachedObject])
class CacheDatabase extends _$CacheDatabase {
  CacheDatabase(super.e);

  @override
  int get schemaVersion => 1;
}

extension CacheObjectConversion on CacheObject {
  CachedObjectCompanion toInsertion({bool setTouchedToNow = true}) =>
      CachedObjectCompanion.insert(
        url: url,
        key: key,
        path: relativePath,
        etag: Value.absentIfNull(eTag),
        validTill: validTill.millisecondsSinceEpoch,
        touched:
            (setTouchedToNow ? clock.now() : touched)?.millisecondsSinceEpoch ??
                0,
        length: Value.absentIfNull(length),
      );

  CachedObjectCompanion toUpdate({bool setTouchedToNow = true}) =>
      CachedObjectCompanion(
        url: Value(url),
        key: Value(key),
        path: Value(relativePath),
        etag: Value(eTag),
        validTill: Value(validTill.millisecondsSinceEpoch),
        touched: Value(
            (setTouchedToNow ? clock.now() : touched)?.millisecondsSinceEpoch ??
                0),
        length: Value(length),
      );
}

extension CachedObjectConversion on CachedObjectData {
  CacheObject toCacheObject() => CacheObject(
        url,
        relativePath: path,
        validTill: DateTime.fromMillisecondsSinceEpoch(validTill),
        key: key,
        eTag: etag,
        id: id,
        length: length,
        touched: DateTime.fromMillisecondsSinceEpoch(touched),
      );
}
