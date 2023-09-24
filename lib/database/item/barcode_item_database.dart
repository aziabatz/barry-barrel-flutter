import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'barcode_item_dao.dart';
import 'barcode_item_entity.dart';

part 'barcode_item_database.g.dart';

@Database(version: 2, entities: [BarcodeItemEntity])
abstract class BarcodeItemDatabase extends FloorDatabase {
  BarcodeItemDao get barcodeItemDao;
}