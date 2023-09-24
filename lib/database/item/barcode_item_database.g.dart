// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_item_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorBarcodeItemDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BarcodeItemDatabaseBuilder databaseBuilder(String name) =>
      _$BarcodeItemDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BarcodeItemDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$BarcodeItemDatabaseBuilder(null);
}

class _$BarcodeItemDatabaseBuilder {
  _$BarcodeItemDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$BarcodeItemDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$BarcodeItemDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<BarcodeItemDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$BarcodeItemDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$BarcodeItemDatabase extends BarcodeItemDatabase {
  _$BarcodeItemDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  BarcodeItemDao? _barcodeItemDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `barcode_items` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `barcode` TEXT NOT NULL, `nameDescription` TEXT NOT NULL, `quantity` INTEGER NOT NULL, `price` REAL NOT NULL, `acquisitionDate` TEXT NOT NULL, `provider` TEXT, `storageLocation` TEXT, `notes` TEXT, `favourite` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  BarcodeItemDao get barcodeItemDao {
    return _barcodeItemDaoInstance ??=
        _$BarcodeItemDao(database, changeListener);
  }
}

class _$BarcodeItemDao extends BarcodeItemDao {
  _$BarcodeItemDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _barcodeItemEntityInsertionAdapter = InsertionAdapter(
            database,
            'barcode_items',
            (BarcodeItemEntity item) => <String, Object?>{
                  'id': item.id,
                  'barcode': item.barcode,
                  'nameDescription': item.nameDescription,
                  'quantity': item.quantity,
                  'price': item.price,
                  'acquisitionDate': item.acquisitionDate,
                  'provider': item.provider,
                  'storageLocation': item.storageLocation,
                  'notes': item.notes,
                  'favourite': item.favourite ? 1 : 0
                }),
        _barcodeItemEntityUpdateAdapter = UpdateAdapter(
            database,
            'barcode_items',
            ['id'],
            (BarcodeItemEntity item) => <String, Object?>{
                  'id': item.id,
                  'barcode': item.barcode,
                  'nameDescription': item.nameDescription,
                  'quantity': item.quantity,
                  'price': item.price,
                  'acquisitionDate': item.acquisitionDate,
                  'provider': item.provider,
                  'storageLocation': item.storageLocation,
                  'notes': item.notes,
                  'favourite': item.favourite ? 1 : 0
                }),
        _barcodeItemEntityDeletionAdapter = DeletionAdapter(
            database,
            'barcode_items',
            ['id'],
            (BarcodeItemEntity item) => <String, Object?>{
                  'id': item.id,
                  'barcode': item.barcode,
                  'nameDescription': item.nameDescription,
                  'quantity': item.quantity,
                  'price': item.price,
                  'acquisitionDate': item.acquisitionDate,
                  'provider': item.provider,
                  'storageLocation': item.storageLocation,
                  'notes': item.notes,
                  'favourite': item.favourite ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BarcodeItemEntity> _barcodeItemEntityInsertionAdapter;

  final UpdateAdapter<BarcodeItemEntity> _barcodeItemEntityUpdateAdapter;

  final DeletionAdapter<BarcodeItemEntity> _barcodeItemEntityDeletionAdapter;

  @override
  Future<List<BarcodeItemEntity>> findAllItems() async {
    return _queryAdapter.queryList('SELECT * FROM barcode_items',
        mapper: (Map<String, Object?> row) => BarcodeItemEntity(
            row['id'] as int,
            row['barcode'] as String,
            row['nameDescription'] as String,
            row['quantity'] as int,
            row['price'] as double,
            row['acquisitionDate'] as String,
            row['provider'] as String?,
            row['storageLocation'] as String?,
            row['notes'] as String?,
            (row['favourite'] as int) != 0));
  }

  @override
  Future<BarcodeItemEntity?> findItemById(int id) async {
    return _queryAdapter.query('SELECT * FROM barcode_items WHERE id = ?1',
        mapper: (Map<String, Object?> row) => BarcodeItemEntity(
            row['id'] as int,
            row['barcode'] as String,
            row['nameDescription'] as String,
            row['quantity'] as int,
            row['price'] as double,
            row['acquisitionDate'] as String,
            row['provider'] as String?,
            row['storageLocation'] as String?,
            row['notes'] as String?,
            (row['favourite'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<void> insertItem(BarcodeItemEntity item) async {
    await _barcodeItemEntityInsertionAdapter.insert(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertAll(List<BarcodeItemEntity> items) async {
    await _barcodeItemEntityInsertionAdapter.insertList(
        items, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateItem(BarcodeItemEntity item) async {
    await _barcodeItemEntityUpdateAdapter.update(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteItem(BarcodeItemEntity item) async {
    await _barcodeItemEntityDeletionAdapter.delete(item);
  }
}
