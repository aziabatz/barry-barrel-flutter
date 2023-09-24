import 'package:floor/floor.dart';


@Entity(tableName: 'barcode_items')
class BarcodeItemEntity{
  @PrimaryKey(autoGenerate: true)
  final int id;

  String barcode;
  String nameDescription;
  int quantity;
  double price;
  String acquisitionDate;
  String? provider;
  String? storageLocation;
  String? notes;
  bool favourite;

  BarcodeItemEntity(
    this.id,
    this.barcode,
    this.nameDescription,
    this.quantity,
    this.price,
    this.acquisitionDate,
    this.provider,
    this.storageLocation,
    this.notes,
    this.favourite
  );
}