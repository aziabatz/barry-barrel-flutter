import 'package:bbarr/database/item/barcode_item_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class BarcodeItemDao {
  @Query('SELECT * FROM barcode_items')
  Future<List<BarcodeItemEntity>> findAllItems();

  @Query('SELECT * FROM barcode_items WHERE id = :id')
  Future<BarcodeItemEntity?> findItemById(int id);

  @insert
  Future<void> insertItem(BarcodeItemEntity item);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAll(List<BarcodeItemEntity> items);

  @update
  Future<void> updateItem(BarcodeItemEntity item);

  @delete
  Future<void> deleteItem(BarcodeItemEntity item);
}