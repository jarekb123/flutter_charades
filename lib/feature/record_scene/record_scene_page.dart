import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kalambury/feature/record_scene/record_scene_initializer_state.dart';

class RecordScenePage extends StatefulWidget {
  const RecordScenePage({Key key}) : super(key: key);

  @override
  _RecordScenePageState createState() => _RecordScenePageState();
}

class _RecordScenePageState extends State<RecordScenePage> {
  RecordSceneInitBloc _recordSceneInitBloc;

  @override
  void initState() {
    super.initState();
    _recordSceneInitBloc = RecordSceneInitBloc();
    _recordSceneInitBloc.add(RecordSceneInitEvent());
  }

  @override
  void dispose() {
    _recordSceneInitBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecordSceneInitBloc>.value(
      value: _recordSceneInitBloc,
      child: Scaffold(
        body: Center(
          child: BlocBuilder<RecordSceneInitBloc, RecordSceneInitState>(
            builder: (context, state) => CountdownWidget(
              second: state.remainingSeconds,
            ),
          ),
        ),
      ),
    );
  }
}

class CountdownWidget extends HookWidget {
  const CountdownWidget({Key key, @required this.second}) : super(key: key);

  final int second;

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
        AnimatedBuilder(
          builder: (context, _) => CircularProgressIndicator(
            value: controller.value,
          ),
          animation: controller,
        ),
        Text('$second')
      ],
    );
  }
}
