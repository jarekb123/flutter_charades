import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kalambury/utils/rx_utils.dart';

part 'record_scene_bloc.freezed.dart';

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
  static const _videoDuration = Duration(seconds: 10);

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
