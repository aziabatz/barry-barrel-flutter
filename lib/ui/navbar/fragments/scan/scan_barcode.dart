import 'package:bbarr/ui/add_edit/edit_screen.dart';
import 'package:bbarr/ui/navbar/fragments/scan/qr_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

class ScanBarcode extends StatefulWidget {
  const ScanBarcode({super.key});

  @override
  State<ScanBarcode> createState() => _ScanBarcodeState();
}

class _ScanBarcodeState extends State<ScanBarcode> {
  String? _qrInfo = 'Scan a QR/Bar code';
  bool _camState = false;

  _qrCallback(String? code) async {
    setState(() {
      _camState = false;
      _qrInfo = code;
      print("camera off");
    });

    await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditScreen(barcodeContent: _qrInfo,)))
                      .then((value) => setState((){

                        print("I am back");
                        _camState = true;
                        //_qrInfo = "whatever";
                        print("camera on");

                      }));
    
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  _suspendScan(){
    setState(() {
      _camState = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _scanCode();
  }

  @override
  void dispose() {
    _suspendScan();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _camState
        ? Center(
            child: SizedBox(
              height: 1000,
              width: 500,
              child: QRBarScannerCamera(
                  onError: (context, error) => Text(
                        error.toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                  qrCodeCallback: (code) {
                    _qrCallback(code);
                  },
                  child: Positioned.fill(
                    child: Container(
                      decoration: ShapeDecoration(
                        shape: QrScannerOverlayShape(
                          borderColor: Colors.white,
                          borderRadius: 10,
                          borderLength: 10,
                          borderWidth: 5,
                          cutOutSize: 250,
                        ),
                      ),
                    ),
                  )),
            ),
          )
        : Center(
            child: Text(_qrInfo!),
          );
  }
}
