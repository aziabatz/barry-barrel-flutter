import 'package:floor/floor.dart';


@Entity(tableName: 'barcode_items')
class BarcodeItemEntity{
  @PrimaryKey(autoGenerate: true)
  final int id;

  final String barcode;
  final String nameDescription;
  final int quantity;
  final double price;
  final String? acquisitionDate;
  final String? provider;
  final String? storageLocation;
  final String? notes;

  BarcodeItemEntity(
    this.id,
    this.barcode,
    this.nameDescription,
    this.quantity,
    this.price,
    this.acquisitionDate,
    this.provider,
    this.storageLocation,
    this.notes
  );
}