import 'dart:io';

import 'package:drift/drift.dart';
import 'package:flutter_cache_manager/src/storage/cache_info_repositories/cache_info_repository.dart';
import 'package:flutter_cache_manager/src/storage/cache_info_repositories/helper_methods.dart';
import 'package:flutter_cache_manager/src/storage/cache_object.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';

import 'cache_database.dart';

class CacheObjectProvider extends CacheInfoRepository
    with CacheInfoRepositoryHelperMethods {
  CacheDatabase? db;
  String? _path;
  String? databaseName;

  /// Either the path or the database name should be provided.
  /// If the path is provider it should end with '{databaseName}.db',
  /// for example: /data/user/0/com.example.example/databases/imageCache.db
  CacheObjectProvider({String? path, this.databaseName}) : _path = path;

  @override
  Future<bool> open() async {
    if (!shouldOpenOnNewConnection()) {
      return openCompleter!.future;
    }
    final path = await _getPath();
    await File(path).parent.create(recursive: true);
    db = CacheDatabase(NativeDatabase(File(path)));
    return opened();
  }

  @override
  Future<dynamic> updateOrInsert(CacheObject cacheObject) {
    if (cacheObject.id == null) {
      return insert(cacheObject);
    } else {
      return update(cacheObject);
    }
  }

  @override
  Future<CacheObject> insert(CacheObject cacheObject,
      {bool setTouchedToNow = true}) async {
    final id = await db!.into(db!.cachedObject).insert(
          cacheObject.toInsertion(setTouchedToNow: setTouchedToNow),
        );
    return cacheObject.copyWith(id: id);
  }

  @override
  Future<CacheObject?> get(String key) async => (db!.select(db!.cachedObject)
        ..where(
          (tbl) => tbl.key.equals(key) | tbl.url.equals(key),
        ))
      .map((d) => d.toCacheObject())
      .getSingleOrNull();

  @override
  Future<int> delete(int id) =>
      (db!.delete(db!.cachedObject)..where((tbl) => tbl.id.equals(id))).go();

  @override
  Future<int> deleteAll(Iterable<int> ids) =>
      (db!.delete(db!.cachedObject)..where((tbl) => tbl.id.isIn(ids))).go();

  @override
  Future<int> update(CacheObject cacheObject, {bool setTouchedToNow = true}) =>
      (db!.update(db!.cachedObject)
            ..where((tbl) => tbl.id.equals(cacheObject.id!)))
          .write(cacheObject.toUpdate(setTouchedToNow: setTouchedToNow));

  @override
  Future<List<CacheObject>> getAllObjects() async =>
      db!.select(db!.cachedObject).map(((d) => d.toCacheObject())).get();

  @override
  Future<List<CacheObject>> getObjectsOverCapacity(int capacity) async =>
      (db!.select(db!.cachedObject)
            ..where(
              (tbl) => tbl.touched.isSmallerThanValue(
                DateTime.now()
                    .subtract(const Duration(days: 1))
                    .millisecondsSinceEpoch,
              ),
            )
            ..orderBy(
              [
                (t) => OrderingTerm(
                      expression: t.touched,
                      mode: OrderingMode.desc,
                    ),
              ],
            )
            ..limit(
              100,
              offset: capacity,
            ))
          .map((d) => d.toCacheObject())
          .get();

  @override
  Future<List<CacheObject>> getOldObjects(Duration maxAge) async =>
      (db!.select(db!.cachedObject)
            ..where(
              (tbl) => tbl.touched.isSmallerThanValue(
                DateTime.now().subtract(maxAge).millisecondsSinceEpoch,
              ),
            )
            ..limit(100))
          .map((d) => d.toCacheObject())
          .get();

  @override
  Future<bool> close() async {
    if (!shouldClose()) return false;
    await db!.close();
    return true;
  }

  @override
  Future<void> deleteDataFile() async {
    await _getPath();
  }

  @override
  Future<bool> exists() async {
    final path = await _getPath();
    return File(path).exists();
  }

  Future<String> _getPath() async {
    Directory directory;
    if (_path != null) {
      directory = File(_path!).parent;
    } else {
      directory = await getApplicationSupportDirectory();
    }
    await directory.create(recursive: true);
    if (_path == null || !_path!.endsWith('.db')) {
      _path = join(directory.path, '$databaseName.db');
    }
    return _path!;
  }
}
