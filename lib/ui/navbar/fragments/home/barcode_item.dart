
import 'package:bbarr/database/item/barcode_item_entity.dart';
import 'package:bbarr/main.dart';
import 'package:flutter/material.dart';

class BarcodeItemWidget extends StatefulWidget{

  late String? _thumbnail;
  late String _barcode, _title, _date;
  late bool _bookmarked;

  final int id;

  BarcodeItemWidget(
    String barcode,
    String? thumbnail,
    String title,
    String date,
    bool bookmarked, {super.key, required this.id}
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
            SizedBox(width: 84,child: Image.asset("assets/barcode.png",
            fit: BoxFit.contain,),),
            Center(child: Text(widget._barcode),)
          ],
        ),
         Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          Text(widget._title,
            overflow: TextOverflow.ellipsis,),
          Text("Date of creation ${widget._date}",
            overflow: TextOverflow.ellipsis,)
        ],),
        ),
        
        

        Container(
          padding: const EdgeInsets.all(0),
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: (widget._bookmarked ? const Icon(Icons.star) : const Icon(Icons.star_border)),
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
    Future<BarcodeItemEntity?> itemFuture = database.barcodeItemDao.findItemById(widget.id);
      itemFuture.then((item){
        if(item != null){
          bool newBookmarkState = !item.favourite;
          item.favourite = newBookmarkState;

          database.barcodeItemDao.updateItem(item).then((value){
            setState(() {
              widget._bookmarked = newBookmarkState;
            });
          });
        }
        
      });
    
  }
}