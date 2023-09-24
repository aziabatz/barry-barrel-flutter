import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BarcodeItemWidget extends StatefulWidget{

  late String? _thumbnail;
  late String _barcode, _title, _date;
  late bool _bookmarked;

  BarcodeItemWidget(
    String barcode,
    String? thumbnail,
    String title,
    String date,
    bool bookmarked
  ){
    _thumbnail = thumbnail;
    _barcode = barcode;
    _title = title;
    _date = date;
    _bookmarked = bookmarked;
  }

  @override
  State<BarcodeItemWidget> createState() => _createBookmarkState();
}

class _createBookmarkState extends State<BarcodeItemWidget>{
  _createBookmarkState();

  //bool _isBookmark = false;


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
            Center(child: Text(widget._barcode),)
          ],
        ),
         Expanded(
          child: Column(children: [
          Text(widget._title,
            overflow: TextOverflow.ellipsis,),
          Text("Date of creation ${widget._date}",
            overflow: TextOverflow.ellipsis,)
        ],crossAxisAlignment: CrossAxisAlignment.start,),
        ),
        
        

        Container(
          padding: EdgeInsets.all(0),
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: (widget._bookmarked ? Icon(Icons.star) : Icon(Icons.star_border)),
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
      widget._bookmarked = !widget._bookmarked;
    });
  }
}