import 'dart:convert';

import 'package:bbarr/database/item/barcode_item_entity.dart';
import 'package:bbarr/main.dart';
import 'package:bbarr/ui/add_edit/bookmark_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditScreen extends StatelessWidget {
  int? itemId;
  late BarcodeItemEntity entity;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();

  late BookmarkCheckbox checkBox;

  EditScreen({key, this.itemId});

  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = !entity.acquisitionDate.isEmpty
        ? DateTime.parse(entity.acquisitionDate)
        : DateTime.now();

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      // Update the entity and the _dateController with the selected date
      entity.acquisitionDate = picked.toString();
      _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future<BarcodeItemEntity?> _fetchItem() async {
    if (itemId != null) {
      return await database.barcodeItemDao.findItemById(itemId!);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final String _titleAction = (itemId == null) ? "Add": "Edit";
    final String _buttonAction = (itemId == null) ? "Create": "Update";

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('$_titleAction item'),
        ),
        body: FutureBuilder(
          future: _fetchItem(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return AlertDialog(
                title: Text("An error ocurred!"),
                content: Text("Cannot retrieve item from database"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context, "OK"),
                      child: Text("OK"))
                ],
              );
            }

            if (!snapshot.hasData || snapshot.data == null) {
              entity =
                  BarcodeItemEntity(0, '', '', 0, 0, '', '', '', '', false);
            } else {
              entity = snapshot.data!;
            }

            print(entity.acquisitionDate);

            final datePicker = TextFormField(
              controller: _dateController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: const InputDecoration(
                labelText: 'Date of adquisition',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please, select a date';
                }
                return null;
              },
            );

            datePicker.controller?.text = entity.acquisitionDate.isNotEmpty
                ? DateFormat('yyyy-MM-dd')
                    .format(DateTime.parse(entity.acquisitionDate))
                : '';

            return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Barcode'),
                        initialValue: entity.barcode,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please insert a valid barcode';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          entity.barcode = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: entity.nameDescription,
                        decoration:
                            InputDecoration(labelText: 'Description name'),
                        onSaved: (value) {
                          entity.nameDescription = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: entity.quantity.toString(),
                        decoration: InputDecoration(labelText: 'Quantity'),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          entity.quantity = int.tryParse(value!) ?? 0;
                        },
                      ),
                      TextFormField(
                        initialValue: entity.price.toString(),
                        decoration: InputDecoration(labelText: 'Price'),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          entity.price = double.tryParse(value!) ?? 0.0;
                        },
                      ),
                      datePicker,
                      TextFormField(
                        initialValue: entity.provider,
                        decoration: InputDecoration(labelText: 'Provider'),
                        onSaved: (value) {
                          entity.provider = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: entity.storageLocation,
                        decoration:
                            InputDecoration(labelText: 'Storage location'),
                        onSaved: (value) {
                          entity.storageLocation = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: entity.notes,
                        decoration: InputDecoration(labelText: 'Notes'),
                        onSaved: (value) {
                          entity.notes = value!;
                        },
                      ),
                      checkBox = BookmarkCheckbox(isBookmark: entity.favourite),
                      ElevatedButton(
                        onPressed: () => _commitToDatabase(context),
                        child: Text('$_buttonAction item'),
                      ),
                    ],
                  ),
                ));
          },
        ));
  }

  void _commitToDatabase(BuildContext context) {
    
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print("Saving to database...");

      entity.favourite = checkBox.isBookmark;

      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      String pretty = encoder.convert(entity.toJson());
      print(pretty);

      //database.barcodeItemDao.updateItem();
      if(itemId!=null) {
        database.barcodeItemDao.updateItem(entity)
          .then((value){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Inserted item successfully")));
            Navigator.pop(context);
          }).catchError((error){
            showDialog(context: context,
            builder: (context){
              return AlertDialog(
                title: Text('Error!'),
                content: Text('An error occurred while inserting new item in DB. More information: $error'),
                actions: [TextButton(onPressed: ()=>Navigator.pop(context), child: Text('OK'))],
              );
            });
          });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('NOT IMPLEMENTED YET')));
        Navigator.pop(context);
      }
    }
  }

  //@override
  //State<EditScreen> createState() => _EditScreenState();
}