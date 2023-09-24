import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailsScreen extends StatelessWidget {

  late int _id;

  DetailsScreen(int id){
    _id = id;
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
          title: Text("Details screen"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  "assets/barcode.png",
                  fit: BoxFit.contain,
                ),
                width: 300,
              ),
              Center(
                child: Text("1234567890",
                    style: TextStyle(fontSize: 28)),
              ),
              Center(
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    Container(
                        color: Colors.amber.shade100,
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: Text("Creation Date: 01-01-2023"),
                        )
                    ),
                    Container(
                        color: Colors.amber.shade100,
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: Text("Barcode: 012312438"),
                        )
                    ),
                    Container(
                        color: Colors.amber.shade100,
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: Text("Quantity: 321"),
                        )
                    ),
                    Container(
                        color: Colors.amber.shade100,
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: Text("Description: LoremIpsum"),
                        )
                    ),
                    Container(
                        color: Colors.amber.shade100,
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: Text("Creation Date"),
                        )
                    )
                  ],
                ),
              )
            ],
          )),
        )
        ;
  }
}
