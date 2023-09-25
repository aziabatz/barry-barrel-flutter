import 'package:bbarr/ui/add_edit/edit_screen.dart';
import 'package:bbarr/utils/check_platform.dart';
import 'package:bbarr/database/item/barcode_item_entity.dart';
import 'package:bbarr/ui/navbar/fragments/home/barcode_list.dart';
import 'package:bbarr/ui/navbar/fragments/scan/scan_screen.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'database/item/barcode_item_database.dart';
import 'ui/navbar/icons/barry_barrel_icons.dart';

List<CameraDescription> cameras = [];
late BarcodeItemDatabase database;

final List<BarcodeItemEntity> barcodeItems = [
  BarcodeItemEntity(1, '123456789', 'Producto A', 10, 9.99, '2023-09-23',
      'Proveedor 1', 'Almacén 1', 'Notas sobre el producto A', false),
  BarcodeItemEntity(2, '987654321', 'Producto B', 20, 19.99, '2023-09-24',
      'Proveedor 2', 'Almacén 2', 'Notas sobre el producto B', false),
  BarcodeItemEntity(3, '555555555', 'Producto C', 5, 49.99, '2023-09-25',
      'Proveedor 3', 'Almacén 3', 'Notas sobre el producto C', false),
  BarcodeItemEntity(4, '777777777', 'Producto D', 15, 29.99, '2023-09-26',
      'Proveedor 4', 'Almacén 4', 'Notas sobre el producto D', false),
  BarcodeItemEntity(5, '999999999', 'Producto E', 8, 39.99, '2023-09-27',
      'Proveedor 5', 'Almacén 5', 'Notas sobre el producto E', false),
];

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    if (!isDesktop) {
      cameras = await availableCameras();
    }

    //databaseFactory.deleteDatabase('inventory_test.db');
    database = await $FloorBarcodeItemDatabase
        .databaseBuilder('inventory_test.db')
        .build();

    //barcodeItems.forEach((element) {dao.deleteItem(element);});

    //dao.insertAll(barcodeItems);
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BarryBarrel',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BarryBarrel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _barItem = 0;

  List<String> items =
      List<String>.generate(12321, (index) => "Item number #$index");

  void _onItemTap(int index) {
    setState(() {
      _barItem = index;
    });
  }

  Widget _stackedContainers() {
    return Expanded(
        child: IndexedStack(
      index: _barItem,
      children: [
        Center(
          child: BarcodeList(),
        ),
        const Center(
          child: Text("FILTER"),
        ),
        const ScanScreen(),
        const Center(
          child: Text("UPDATES"),
        ),
        const Center(
          child: Text("SETTINGS"),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          _stackedContainers(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.amber.shade100,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        showUnselectedLabels: false,
        currentIndex: _barItem,
        onTap: _onItemTap,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(BarryBarrel.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(BarryBarrel.filter), label: "Filter"),
          BottomNavigationBarItem(
              icon: Icon(BarryBarrel.barcode), label: "Scan"),
          BottomNavigationBarItem(
              icon: Icon(BarryBarrel.arrows_cw), label: "Updates"),
          BottomNavigationBarItem(
              icon: Icon(BarryBarrel.wrench), label: "Settings"),
        ],
      ),
      
    );
  }
}
