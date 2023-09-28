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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'barcode': barcode,
      'nameDescription': nameDescription,
      'quantity': quantity,
      'price': price,
      'acquisitionDate': acquisitionDate,
      'provider': provider,
      'storageLocation': storageLocation,
      'notes': notes,
      'favourite': favourite,
    };
  }

  @override
  String toString() {
    return 'BarcodeItemEntity{id: $id, barcode: $barcode, nameDescription: $nameDescription, '
        'quantity: $quantity, price: $price, acquisitionDate: $acquisitionDate, '
        'provider: $provider, storageLocation: $storageLocation, notes: $notes, favourite: $favourite}';
  }
}