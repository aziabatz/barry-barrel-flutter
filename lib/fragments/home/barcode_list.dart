import 'package:bbarr/database/item/barcode_item_entity.dart';
import 'package:bbarr/details_screen.dart';
import 'package:bbarr/fragments/home/barcode_item.dart';
import 'package:bbarr/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarcodeList extends StatelessWidget{
  List<BarcodeItemWidget> itemList = [];

  late ListView list;

  Future<List<BarcodeItemEntity>> _retrieveItems() async {
    List<BarcodeItemEntity> items =
        await database.barcodeItemDao.findAllItems();
    return items;
  }

  BarcodeList() {

    //devolver aqui la listview con los elementos desde retrieveitems

    //FIXME Make this a stateful 

    print("REFRESH?");
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _retrieveItems(),
      builder: (context, snapshot) {

        var items = snapshot.data;

        items?.forEach((item) {
          itemList.add(BarcodeItemWidget(
            item.barcode,
            null,
            item.nameDescription,
            "01/11/23",
            false
          ));
        });

        list = ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: IntrinsicWidth(
                child: itemList[index],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsScreen(0)));
              },
            );
            //itemList[index];
          },
        );

        return list;
      },
    );
  }
}


/*

itemBuilder: (context, index) {
        return ListTile(
          title: IntrinsicWidth(
            child: itemList[index],
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => DetailsScreen(0)
            ));
          },

        );
          //itemList[index];
      },
      itemCount: itemList.length,
*/
