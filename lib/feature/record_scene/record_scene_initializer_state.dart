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
abstract class RecordSceneState {}

@freezed
abstract class PreRecordState
    with _$PreRecordState
    implements RecordSceneState {
  const factory PreRecordState({
    @required int remainingSeconds,
  }) = _PreRecordState;
}

@freezed
abstract class ShouldStartRecordingState
    with _$ShouldStartRecordingState
    implements RecordSceneState {
  const factory ShouldStartRecordingState() = _ShouldStartRecordingState;
}

@freezed
abstract class ShouldStopRecordingState
    with _$ShouldStopRecordingState
    implements RecordSceneState {
  const factory ShouldStopRecordingState() = _ShouldStopRecordingState;
}

abstract class RecordSceneEvent {}

class InitRecordSceneEvent implements RecordSceneEvent {}

class OnStartRecordingSceneEvent implements RecordSceneEvent {}

class RecordSceneBloc extends Bloc<RecordSceneEvent, RecordSceneState> {
  static const _initRemainingSeconds = 5;
  static const _videoDuration = Duration(seconds: 30);

  bool _initialized = false;

  @override
  RecordSceneState get initialState =>
      PreRecordState(remainingSeconds: _initRemainingSeconds);

  @override
  Stream<RecordSceneState> mapEventToState(
    RecordSceneEvent event,
  ) async* {
    if (event is InitRecordSceneEvent) {
      if (!_initialized) {
        _initialized = true;

        yield* Stream.periodic(
          Duration(seconds: 1),
          (elapsedSeconds) => _initRemainingSeconds - elapsedSeconds - 1,
        )
            .takeWhile((seconds) => seconds >= 0)
            .map<RecordSceneState>((remainingSeconds) =>
                PreRecordState(remainingSeconds: remainingSeconds))
            .onDoneResume(
              () => Stream.value(ShouldStartRecordingState()),
            );
      }
    } else if (event is OnStartRecordingSceneEvent) {
      yield await Future.delayed(
        _videoDuration,
        () => ShouldStopRecordingState(),
      );
    }
  }
}
