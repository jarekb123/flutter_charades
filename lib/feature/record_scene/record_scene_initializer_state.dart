import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

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