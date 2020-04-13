import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:kalambury/utils/rx_utils.dart';

part 'record_scene_initializer_state.freezed.dart';

class RecordSceneInitializer extends ChangeNotifier {
  static const _secondsToStart = 5;

  final _remainingSeconds = BehaviorSubject<int>();
  final _subscriptions = CompositeSubscription();

  bool _initialized = false;

  Stream<int> get remainingSeconds => _remainingSeconds;
  bool get startRecording => _initialized;

  @override
  void dispose() {
    _remainingSeconds.close();
    super.dispose();
  }

  void init() {
    _subscriptions.add(
      Stream.periodic(
        Duration(seconds: 1),
        (elapsedSeconds) => _secondsToStart - elapsedSeconds,
      ).take(_secondsToStart + 1).doOnDone(() {
        _remainingSeconds.close();
        _initialized = true;
        notifyListeners();
      }).listen(_remainingSeconds.add),
    );
  }
}

// BLOC version
@freezed
abstract class RecordSceneInitState with _$RecordSceneInitState {
  const factory RecordSceneInitState({
    @required int remainingSeconds,
    @required bool shouldStartRecording,
  }) = _RecordSceneInitState;
}

class RecordSceneInitEvent {}

class RecordSceneInitBloc
    extends Bloc<RecordSceneInitEvent, RecordSceneInitState> {
  @override
  RecordSceneInitState get initialState =>
      RecordSceneInitState(remainingSeconds: 5, shouldStartRecording: false);

  bool _initialized = false;

  @override
  Stream<RecordSceneInitState> mapEventToState(
    RecordSceneInitEvent event,
  ) async* {
    if (!_initialized) {
      _initialized = true;

      yield* Stream.periodic(
        Duration(seconds: 1),
        (elapsedSeconds) => initialState.remainingSeconds - elapsedSeconds - 1,
      )
          .takeWhile((seconds) => seconds > 0)
          .map((remainingSeconds) => RecordSceneInitState(
              remainingSeconds: remainingSeconds, shouldStartRecording: false))
          .onDoneResume(
            () => Stream.value(RecordSceneInitState(
                remainingSeconds: 0, shouldStartRecording: true)),
          );
    }
  }
}
