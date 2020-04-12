import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kalambury/repositories/video_repository.dart';
import 'package:rxdart/rxdart.dart';

part 'upload_video_state.freezed.dart';

class UploadVideoTask extends ChangeNotifier {
  final VideoRepository _videoRepository;

  UploadVideoTask(this._videoRepository)
      : _subscriptions = CompositeSubscription(),
        _progressSubject = BehaviorSubject();

  final CompositeSubscription _subscriptions;
  final BehaviorSubject<int> _progressSubject;

  bool _uploadFinished = false;
  bool _hasError = false;

  Stream<int> get progress => _progressSubject;
  bool get finished => _uploadFinished;
  bool get hasError => _hasError;

  @override
  void dispose() {
    _subscriptions.dispose();
    super.dispose();
  }

  void uploadVideo(String videoFilePath) {
    final uploadTask = _videoRepository.uploadVideo(videoFilePath).doOnDone(() {
      _uploadFinished = true;
      notifyListeners();
    }).doOnError((_) {
      _hasError = true;
      notifyListeners();
    }).listen((progress) => _progressSubject.add(progress.floor()));
    _subscriptions.add(uploadTask);
  }
}

// FOR COMPARISON - UploadVideo using BLOC Library

@freezed
abstract class UploadVideoState with _$UploadVideoState {
  const factory UploadVideoState({
    @required int progress,
    @required bool isFinished,
    @required bool hasError,
  }) = _UploadVideoState;
}

class UploadVideoEvent {
  final String videoFilePath;

  UploadVideoEvent(this.videoFilePath);
}

class UploadVideoBloc extends Bloc<UploadVideoEvent, UploadVideoState> {
  final VideoRepository _videoRepository;

  UploadVideoBloc(this._videoRepository);

  @override
  UploadVideoState get initialState =>
      UploadVideoState(progress: 0, isFinished: false, hasError: false);

  @override
  Stream<UploadVideoState> mapEventToState(UploadVideoEvent event) async* {
    yield* _videoRepository
        .uploadVideo(event.videoFilePath)
        .map((progress) => UploadVideoState(
              progress: progress.floor(),
              isFinished: false,
              hasError: false,
            ))
        .concatWith([_onFinished()]).onErrorResume(
            (error) => Stream.value(state.copyWith.call(hasError: true)));
  }

  Stream<UploadVideoState> _onFinished() async* {
    yield state.copyWith.call(isFinished: true);
  }
}
