import 'package:bbarr/database/item/barcode_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditScreen extends StatefulWidget {
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _dateController = TextEditingController();

  String barcode = "";

  String nameDescription = "";

  int quantity = 0;

  double price = 0.0;

  DateTime acquisitionDate = DateTime.now();

  String provider = "";

  String storageLocation = "";

  String notes = "";

  bool favourite = false;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ));

    picked = (picked == null) ? DateTime.now() : picked;

    if (picked != null && picked != acquisitionDate) {
      acquisitionDate = picked;
      _dateController.text = DateFormat('yyyy-MM-dd').format(acquisitionDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Add item"),
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Barcode'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please insert a valid barcode';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      barcode = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Description name'),
                    onSaved: (value) {
                      nameDescription = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Quantity'),
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      quantity = int.tryParse(value!) ?? 0;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      price = double.tryParse(value!) ?? 0.0;
                    },
                  ),
                  TextFormField(
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
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Provider'),
                    onSaved: (value) {
                      provider = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Storage location'),
                    onSaved: (value) {
                      storageLocation = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Notes'),
                    onSaved: (value) {
                      notes = value!;
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Favourite'),
                    subtitle: const Text('Add item to bookmarks'),
                    activeColor: Colors.pink,
                    value: favourite,
                    selected: favourite,
                    onChanged: (value) {
                      setState(() {
                        favourite = value!;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        final newItem = BarcodeItemEntity(
                          0,
                          barcode,
                          nameDescription,
                          quantity,
                          price,
                          acquisitionDate.toIso8601String(),
                          provider,
                          storageLocation,
                          notes,
                          favourite,
                        );
                      }
                    },
                    child: Text('Create item'),
                  ),
                ],
              ),
            )));
  }
}
