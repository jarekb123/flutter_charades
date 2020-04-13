import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kalambury/feature/camera/camera_widgets.dart';
import 'package:kalambury/feature/record_scene/record_scene_bloc.dart';
import 'package:kalambury/utils/paths.dart';

class RecordScenePage extends StatefulWidget {
  const RecordScenePage({Key key}) : super(key: key);

  @override
  _RecordScenePageState createState() => _RecordScenePageState();
}

class _RecordScenePageState extends State<RecordScenePage> {
  RecordSceneBloc _recordSceneInitBloc;
  CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    _recordSceneInitBloc = RecordSceneBloc();

    availableCameras().then((cameras) {
      _cameraController =
          CameraController(cameras[1], ResolutionPreset.ultraHigh)
            ..initialize().then((value) {
              _recordSceneInitBloc.add(InitRecordSceneEvent());
              setState(() {});
            })
            ..prepareForVideoRecording();
    });
  }

  @override
  void dispose() {
    _recordSceneInitBloc.close();
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecordSceneBloc>.value(
      value: _recordSceneInitBloc,
      child: Scaffold(
        body: Center(
          child: BlocConsumer<RecordSceneBloc, RecordSceneState>(
            listener: (context, state) async {
              if (state is ShouldStartRecordingState) {
                final path = await videosTempDir();
                await _cameraController.startVideoRecording(
                    '$path/${DateTime.now().toIso8601String()}.mp4');
                context
                    .bloc<RecordSceneBloc>()
                    .add(OnStartRecordingSceneEvent());
              } else if (state is ShouldStopRecordingState) {
                _cameraController.stopVideoRecording();
              }
            },
            builder: (context, state) {
              final showCountdown =
                  (_cameraController?.value?.isInitialized ?? false) &&
                      state is PreRecordState;

              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  CameraView(
                    loadingBuilder: (_) => Container(color: Colors.transparent),
                    cameraController: _cameraController,
                  ),
                  _CustomFadeSwitcher(
                    child: showCountdown ? CountdownOverlay() : null,
                    duration: Duration(milliseconds: 700),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CountdownOverlay extends StatelessWidget {
  const CountdownOverlay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).backgroundColor.withOpacity(0.5),
      ),
      child: BlocBuilder<RecordSceneBloc, RecordSceneState>(
        builder: (context, state) => CountdownWidget(
          second: state is PreRecordState ? state.remainingSeconds : 0,
          secondTextStyle: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}

class CountdownWidget extends HookWidget {
  const CountdownWidget({
    Key key,
    @required this.second,
    this.radius = 32,
    this.secondTextStyle,
  }) : super(key: key);

  final int second;
  final double radius;
  final TextStyle secondTextStyle;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
        duration: Duration(milliseconds: 700), keys: [second]);
    useEffect(() {
      controller.forward();

      return null;
    }, [controller]);

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 2 * radius,
          width: 2 * radius,
          child: AnimatedBuilder(
            builder: (context, _) => CircularProgressIndicator(
              value: controller.value,
            ),
            animation: controller,
          ),
        ),
        _CustomFadeSwitcher(
          child: Text('$second', key: ValueKey(second), style: secondTextStyle),
        )
      ],
    );
  }
}

class _CustomFadeSwitcher extends StatelessWidget {
  const _CustomFadeSwitcher({
    Key key,
    @required this.child,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: Curves.fastOutSlowIn,
      transitionBuilder: (child, animation) {
        return AnimatedBuilder(
          builder: (context, child) {
            final opacity =
                CurveTween(curve: Interval(0.7, 1)).evaluate(animation);
            return Opacity(opacity: opacity, child: child);
          },
          child: child,
          animation: animation,
        );
      },
      child: child,
    );
  }
}
