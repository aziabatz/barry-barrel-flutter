import 'package:bbarr/details_screen.dart';
import 'package:bbarr/fragments/home/barcode_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarcodeList {
  final List<BarcodeItemWidget> itemList =
      List.generate(123, (index) => BarcodeItemWidget());

  late ListView list;

  BarcodeList() {
    this.list = ListView.builder(
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
    );
  }
}
