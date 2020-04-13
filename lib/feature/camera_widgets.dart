import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CameraView extends StatelessWidget {
  const CameraView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _PhoneCamerasProvider(
      child: Builder(builder: (context) {
        final cameras = Provider.of<List<CameraDescription>>(context);
        print(cameras);
        if (cameras == null) {
          return Container(color: Colors.greenAccent);
        } else {
          return CameraApp(camera: cameras[1]);
        }
      }),
    );
  }
}

class _PhoneCameraPreview extends StatefulWidget {
  const _PhoneCameraPreview({Key key, @required this.camera}) : super(key: key);

  final CameraDescription camera;

  @override
  __PhoneCameraPreviewState createState() => __PhoneCameraPreviewState();
}

class __PhoneCameraPreviewState extends State<_PhoneCameraPreview> {
  CameraController _cameraController;

  @override
  void initState() {
    super.initState();

    _cameraController =
        CameraController(widget.camera, ResolutionPreset.ultraHigh);

    _cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((error) => print(error));
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _cameraController.value.aspectRatio,
        child: CameraPreview(_cameraController),
      );
    } else {
      return Container(color: Colors.greenAccent);
    }
  }
}

class _PhoneCamerasProvider extends StatelessWidget {
  const _PhoneCamerasProvider({Key key, @required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<CameraDescription>>(
      create: (_) => availableCameras(),
      child: child,
    );
  }
}

class CameraApp extends StatefulWidget {
  final CameraDescription camera;

  const CameraApp({Key key, this.camera}) : super(key: key);

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.camera, ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller));
  }
}
