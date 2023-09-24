import 'package:bbarr/database/item/barcode_item_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class BarcodeItemDao {
  @Query('SELECT * FROM InventoryItem')
  Future<List<BarcodeItemEntity>> findAllItems();

  @insert
  Future<void> insertItem(BarcodeItemEntity item);

  @update
  Future<void> updateItem(BarcodeItemEntity item);

  @delete
  Future<void> deleteItem(BarcodeItemEntity item);
}