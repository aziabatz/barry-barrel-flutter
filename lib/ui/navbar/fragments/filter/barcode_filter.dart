import 'package:bbarr/ui/navbar/fragments/filter/backdrop_container.dart';
import 'package:bbarr/ui/navbar/fragments/filter/backdrop_screen.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BarcodeFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return BackdropScaffold(backLayer: Center(child: Text("BACK"),), frontLayer: Center(child: Text("FRONT"),) );
    return SlidingUpPanel(
      minHeight: 36,
      backdropEnabled: true,
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      color: Theme.of(context).colorScheme.tertiaryContainer,
      collapsed: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          color: Theme.of(context).colorScheme.tertiaryContainer,
        ),
        
        child: Center(
          child: /* Text(
            "This is the collapsed Widget",
            style: TextStyle(color: Theme.of(context).colorScheme.onTertiary),
          ), */
          Icon(Icons.arrow_circle_up, color: Theme.of(context).colorScheme.onTertiaryContainer)
        ),
      ),
      panel: Center(
        child: BackdropContainer(),
      ),
      body: Center(
        child: Text("This is the Widget behind the sliding panel"),
      ),
    );

    //BackdropScreen();
  }
}
