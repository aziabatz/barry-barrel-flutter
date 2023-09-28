import 'package:bbarr/database/item/barcode_item_entity.dart';
import 'package:bbarr/main.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  //late int _id;
  late BarcodeItemEntity item;

  final int id;

  DetailsScreen({super.key, required this.id}) {
    database.barcodeItemDao.findItemById(id).then((value) {
      if (value != null) {
        item = value;
      }
    });
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
        title: const Text("More details"),
      ),
      body: FutureBuilder<BarcodeItemEntity?>(
        future: database.barcodeItemDao.findItemById(this.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('Elemento no encontrado.'));
          } else {
            final item = snapshot.data!;
            return SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  width: 300,
                  child: Image.asset(
                    "assets/barcode.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Center(
                  child: Text(item.nameDescription,
                      style: const TextStyle(fontSize: 28)),
                ),
                Center(
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: [
                      Container(
                          color: Theme.of(context).highlightColor,
                          margin: const EdgeInsets.all(10),
                          child: Center(
                            child:
                                Text("Acquired: ${item.acquisitionDate}"),
                          )),
                      Container(
                          color: Theme.of(context).highlightColor,
                          margin: const EdgeInsets.all(10),
                          child: Center(
                            child: Text("Barcode: ${item.barcode}"),
                          )),
                      Container(
                          color: Theme.of(context).highlightColor,
                          margin: const EdgeInsets.all(10),
                          child: Center(
                            child: Text("Quantity: ${item.quantity}"),
                          )),
                      Container(
                          color: Theme.of(context).highlightColor,
                          margin: const EdgeInsets.all(10),
                          child: Center(
                            child: Text("Price: ${item.price}"),
                          )),
                      Container(
                          color: Theme.of(context).highlightColor,
                          margin: const EdgeInsets.all(10),
                          child: Center(
                            child: Text("Provider: ${item.provider}"),
                          )),
                      Container(
                          color: Theme.of(context).highlightColor,
                          margin: const EdgeInsets.all(10),
                          child: Center(
                            child: Text("Location: ${item.storageLocation}"),
                          )),
                      Container(
                        padding: const EdgeInsets.all(10),
                          color: Theme.of(context).highlightColor,
                          margin: const EdgeInsets.all(10),
                          child: Center(
                            child: SingleChildScrollView(child: Text("Description: ${item.notes}")),
                          )),
                      
                    ],
                  ),
                )
              ],
            ));
          }
        },
      ),
    );
  }
}

/* 

body: (item == null)? const Center(
          child: Text("There was an error retrieving details about this item."),
        ) : SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 300,
                child: Image.asset(
                  "assets/barcode.png",
                  fit: BoxFit.contain,
                ),
              ),
              Center(
                child: Text(item.nameDescription,
                    style: const TextStyle(fontSize: 28)),
              ),
              Center(
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    Container(
                        color: Colors.amber.shade100,
                        margin: const EdgeInsets.all(10),
                        child: Center(
                          child: Text("Creation Date: ${item.acquisitionDate}"),
                        )
                    ),
                    Container(
                        color: Colors.amber.shade100,
                        margin: const EdgeInsets.all(10),
                        child: Center(
                          child: Text("Barcode: ${item.barcode}"),
                        )
                    ),
                    Container(
                        color: Colors.amber.shade100,
                        margin: const EdgeInsets.all(10),
                        child: Center(
                          child: Text("Quantity: ${item.quantity}"),
                        )
                    ),
                    Container(
                        color: Colors.amber.shade100,
                        margin: const EdgeInsets.all(10),
                        child: const Center(
                          child: Text("Description: LoremIpsum"),
                        )
                    ),
                    Container(
                        color: Colors.amber.shade100,
                        margin: const EdgeInsets.all(10),
                        child: const Center(
                          child: Text("Creation Date: whatever"),
                        )
                    )
                  ],
                ),
              )
            ],
          )),

*/
