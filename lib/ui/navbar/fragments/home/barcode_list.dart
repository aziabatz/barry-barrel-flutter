import 'package:bbarr/database/item/barcode_item_entity.dart';
import 'package:bbarr/ui/add_edit/edit_screen.dart';
import 'package:bbarr/ui/details/details_screen.dart';
import 'package:bbarr/ui/navbar/fragments/home/barcode_item.dart';
import 'package:bbarr/main.dart';
import 'package:flutter/material.dart';

class BarcodeList extends StatelessWidget {
  List<BarcodeItemWidget> itemList = [];

  late ListView list;

  Future<List<BarcodeItemEntity>> _retrieveItems() async {
    List<BarcodeItemEntity> items =
        await database.barcodeItemDao.findAllItems();
    return items;
  }

  BarcodeList({super.key}) {
    //devolver aqui la listview con los elementos desde retrieveitems

    //FIXME Make this a stateful?

    //print("REFRESH?");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _retrieveItems(),
      builder: (context, snapshot) {
        var items = snapshot.data;

        if (items != null) {
          itemList = items
              .map((e) => BarcodeItemWidget(
                  e.barcode, null, e.nameDescription, "01/11/23", e.favourite,
                  id: e.id))
              .toList();
        }

        list = ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return InkWell(
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                            title: const Text('More options'),
                            children: [
                              SimpleDialogOption(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditScreen(itemId: itemList[index].id,)));
                                    //Aqui quiero que se cierre el dialogo, para que cuando vuelva de editscreen lo encuentre ya cerrado
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(Icons.edit),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Text("Edit item")
                                    ],
                                  )),
                              SimpleDialogOption(
                                  onPressed: () {},
                                  child: const Row(
                                    children: [
                                      Icon(Icons.delete),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Text("Remove item")
                                    ],
                                  )),
                              SimpleDialogOption(
                                  onPressed: () {},
                                  child: const Row(
                                    children: [
                                      Icon(Icons.info),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Text("More details")
                                    ],
                                  )),
                              SimpleDialogOption(
                                  onPressed: () {},
                                  child: const Row(
                                    children: [
                                      Icon(Icons.share),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Text("Share")
                                    ],
                                  )),
                            ],
                          ));
                },
                child: ListTile(
                  title: IntrinsicWidth(
                    child: itemList[index],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(id: itemList[index].id)));
                  },
                ));
          },
        );

        return Stack(
          children: [
            list,
            Positioned(
              right: 15,
              bottom: 15,
              child: FloatingActionButton(
                elevation: 10,
                child: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditScreen()));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
