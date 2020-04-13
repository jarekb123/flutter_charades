import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

/** 
 * TODO: Refactor to make CameraView independent of implementation
 * * Reason: to make this widget reusable in other platforms (eg. Flutter for Web)
*/

class CameraView extends StatelessWidget {
  const CameraView({
    Key key,
    @required this.loadingBuilder,
    @required this.cameraController,
  }) : super(key: key);

  /// Builds widget which is shown when camera preview is initializing
  final WidgetBuilder loadingBuilder;

  final CameraController cameraController;

  @override
  Widget build(BuildContext context) {
    if (cameraController == null) {
      return loadingBuilder(context);
    }

    return _MobileCamerasProvider(
      child: Consumer<List<CameraDescription>>(
        builder: (context, cameras, _) {
          if (cameras == null) {
            return loadingBuilder(context);
          } else {
            return _MobileCameraPreview(
              cameraController: cameraController,
              loadingBuilder: loadingBuilder,
            );
          }
        },
      ),
    );
  }
}

class _MobileCameraPreview extends HookWidget {
  const _MobileCameraPreview({
    Key key,
    @required this.cameraController,
    @required this.loadingBuilder,
  }) : super(key: key);

  final CameraController cameraController;
  final WidgetBuilder loadingBuilder;

  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return AspectRatio(
        aspectRatio: cameraController.value.aspectRatio,
        child: CameraPreview(cameraController),
      );
    } else {
      return loadingBuilder(context);
    }
  }
}

class _MobileCamerasProvider extends StatelessWidget {
  const _MobileCamerasProvider({Key key, @required this.child})
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

CameraController useCameraController(
  CameraDescription camera,
  ResolutionPreset resolutionPreset, [
  List<Object> keys = const [],
]) {
  final controller =
      useMemoized(() => CameraController(camera, resolutionPreset), keys);

  useEffect(() => controller.dispose, keys);

  return controller;
}
