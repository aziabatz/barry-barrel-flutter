import 'dart:io';

import 'package:bbarr/check_platform.dart';
import 'package:bbarr/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';


class ScanScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _ScanScreenState();

}

class _ScanScreenState extends State<ScanScreen> with WidgetsBindingObserver{

  CameraController? controller;
  bool _isCameraInit = false;


  @override
  void initState() {
    if(!isDesktop)
      onNewCameraSelected(cameras[0]);
    super.initState();
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;
    if(cameraController == null || !cameraController.value.isInitialized)
      return;

    if(state == AppLifecycleState.inactive){
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed){
      onNewCameraSelected(cameraController.description);
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void onNewCameraSelected(CameraDescription camera) async {
    final previousCamera = controller;
    final CameraController actualController = CameraController(camera,
      ResolutionPreset.medium);

    await previousCamera?.dispose();

    if(mounted){
      setState(() {
        controller = actualController;
      });
    }

    controller?.addListener(() {
      if(mounted){
        setState(() {});
      }
    });

    try{
      await controller?.initialize();
    } on CameraException catch(e) {
      print('Error initializing camera: $e');
    }

    if(mounted){
      setState(() {
        _isCameraInit = controller!.value.isInitialized;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if(Platform.isLinux || Platform.isWindows || Platform.isMacOS){
      return Container(
        child: Center(
          child: Text("Barcode scan from camera is still not implemented in this platform"),
        )
      );
    }
    return _isCameraInit
        ? AspectRatio(
      //FIXME Aspect ratio to fill container or screen
      aspectRatio: 1 / controller!.value.aspectRatio,
      child: controller!.buildPreview(),
    )
        : Container();
  }
}