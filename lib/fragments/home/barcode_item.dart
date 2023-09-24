import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BarcodeItemWidget extends StatefulWidget{

  BarcodeItemWidget();

  @override
  State<BarcodeItemWidget> createState() => _createBookmarkState();
}

class _createBookmarkState extends State<BarcodeItemWidget>{
  _createBookmarkState();

  bool _isBookmark = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        Column(
          children: [
            Container(child: Image.asset("assets/barcode.png",
            fit: BoxFit.contain,),
            width: 84,),
            Center(child: Text("1234567890"),)
          ],
        ),
        Column(children: [
          Text("Lorem Ipsum",
            overflow: TextOverflow.ellipsis,),
          Text("Date of creation 12/04/02",
            overflow: TextOverflow.ellipsis,)
        ],crossAxisAlignment: CrossAxisAlignment.start,),
        Spacer(),
        Container(
          padding: EdgeInsets.all(0),
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: (_isBookmark ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),



        /*Container(
          padding: EdgeInsets.all(5),
          child: Text('barcode 67576434547'),
        ),*/


      ],
    );
  }


  void _toggleFavorite() {
    setState(() {
      _isBookmark = !_isBookmark;
    });
  }
}